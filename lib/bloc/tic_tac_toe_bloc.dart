import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tic_tac_toe_event.dart';
part 'tic_tac_toe_state.dart';

class TicTacToeBloc extends Bloc<TicTacToeEvent, TicTacToeState> {
  bool isPlayerX = true;
  TicTacToeBloc() : super(TicTacToeState(List.generate(9, (index) => ' '))) {
    on<ClickedEvent>(mapEventToState);
    on<RetryGameEvent>(handleRetryGameEvent);
  }

  void mapEventToState(
    TicTacToeEvent event,
    Emitter<TicTacToeState> emit,
  ) {
    if (event is ClickedEvent) {
      handleClickedEvent(event, emit);
    } else if (event is RetryGameEvent) {
      handleRetryGameEvent(event, emit);
    }
  }

  void handleClickedEvent(ClickedEvent event, Emitter<TicTacToeState> emit) {
    List<String> updatedCells = List.from(state.cells);

    if (updatedCells[event.index] == " ") {
      updatedCells[event.index] = isPlayerX ? 'X' : 'O';
      isPlayerX = !isPlayerX;
    }

    emit(TicTacToeState(updatedCells));
  }

  void handleRetryGameEvent(
      TicTacToeEvent event, Emitter<TicTacToeState> emit) {
    emit(TicTacToeState(List.generate(9, (index) => ' ')));
    isPlayerX = true;
  }

  String checkWinner(List<String> cells) {
    for (int i = 0; i < 3; i++) {
      if (cells[i * 3] != ' ' &&
          cells[i * 3] == cells[i * 3 + 1] &&
          cells[i * 3] == cells[i * 3 + 2]) {
        return "WINNER";
      }
    }

    for (int i = 0; i < 3; i++) {
      if (cells[i] != ' ' &&
          cells[i] == cells[i + 3] &&
          cells[i] == cells[i + 6]) {
        return "WINNER";
      }
    }

    if (cells[0] != ' ' && cells[0] == cells[4] && cells[0] == cells[8]) {
        return "WINNER";
    }

    if (cells[2] != ' ' && cells[2] == cells[4] && cells[2] == cells[6]) {
        return "WINNER";
    }
    if (cells.contains(" ")) {
      return " ";
    } else {
        return "DRAW";
          }

  }
}
