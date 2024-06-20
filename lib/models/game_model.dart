import 'package:flutter/material.dart';

class GameModel with ChangeNotifier {
  static const int gridSize = 3;
  List<List<String>> _board = List.generate(gridSize, (_) => List.generate(gridSize, (_) => ''));

  bool _xTurn = true;
  bool _winner = false;
  int _jogadas = 0;

  List<List<String>> get board => _board;

  bool get xTurn => _xTurn;

  bool get winner => _winner;

  int get jogadas => _jogadas;

  String get textoInformativo {
    if (_winner) {
      return '${_xTurn ? 'X' : 'O'} Venceu!';
    } else if (_jogadas == gridSize * gridSize) {
      return 'Empate!';
    } else {
      return '${_xTurn ? 'X' : 'O'} é sua vez.';
    }
  }

  void iniciarJogo() {
    _board = List.generate(gridSize, (_) => List.generate(gridSize, (_) => ''));
    _xTurn = true;
    _winner = false;
    _jogadas = 0;
    notifyListeners();
  }

  void clique({required int linha, required int coluna}) {
    if (_board[linha][coluna] == '' && !_winner) {
      _board[linha][coluna] = _xTurn ? 'X' : 'O';
      _jogadas++;
      _winner = _checkWinner(linha, coluna);
      if (!_winner) {
        _xTurn = !_xTurn;
      }
      notifyListeners();
    }
  }

  bool _checkWinner(int linha, int coluna) {
    String playerSymbol = _board[linha][coluna];

    // Check row
    if (_board[linha].every((symbol) => symbol == playerSymbol)) return true;

    // Check column
    if (_board.every((row) => row[coluna] == playerSymbol)) return true;

    // Check diagonals
    if (linha == coluna && _board.every((row) => row[_board.indexOf(row)] == playerSymbol)) return true;
    if (linha + coluna == gridSize - 1 && _board.every((row) => row[gridSize - 1 - _board.indexOf(row)] == playerSymbol)) return true;

    return false;
  }
}
