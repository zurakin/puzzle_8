import 'dart:collection';

import 'game/move.dart';

class History{
  Queue<Move> history = Queue();

  void clear(){
    history.clear();
  }

  void registerMove(Move move){
    history.addLast(move);
  }

  Move? pop(){
    if (history.isEmpty){
      return null;
    }
    return history.removeLast();
  }

  bool canPop(){
    return history.isNotEmpty;
  }
}