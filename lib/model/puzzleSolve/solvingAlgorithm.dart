import 'package:puzzle_8/model/game/game.dart';
import 'package:puzzle_8/model/game/move.dart';

abstract class SolvingAlgorithm{
  final Game game;

  SolvingAlgorithm(this.game);

  List<Move> solve();
}