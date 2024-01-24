part of 'tic_tac_toe_bloc.dart';

 class TicTacToeEvent {}

class ClickedEvent extends TicTacToeEvent {
  final int index;


  ClickedEvent(this.index);

  
}
class RetryGameEvent extends TicTacToeEvent {}
