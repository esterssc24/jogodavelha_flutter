import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_model.dart';

class GameButton extends StatelessWidget {
  final int linha;
  final int coluna;

  const GameButton({required this.linha, required this.coluna, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameModel = context.watch<GameModel>();
    final String symbol = gameModel.board[linha][coluna];
    final bool isButtonDisabled = symbol.isNotEmpty || gameModel.winner;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: isButtonDisabled ? null : () {
          context.read<GameModel>().clique(linha: linha, coluna: coluna);
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(70, 70),
          backgroundColor: Colors.grey[800],
          textStyle: const TextStyle(color: Colors.white),
        ),
        child: Text(
          symbol,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: symbol == 'X' ? Colors.blue : Colors.red,
          ),
        ),
      ),
    );
  }
}
