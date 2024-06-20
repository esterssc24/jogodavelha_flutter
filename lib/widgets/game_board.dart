import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_model.dart';
import 'game_button.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(GameModel.gridSize, (i) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(GameModel.gridSize, (j) {
            return GameButton(linha: i, coluna: j);
          }),
        );
      }),
    );
  }
}

