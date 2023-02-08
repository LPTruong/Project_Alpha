import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:project_alpha/core/error/failures.dart';
import 'package:project_alpha/core/strings/failures.dart';
// import 'package:flutter/widgets.dart';
import 'package:project_alpha/features/domain/usecases/get_all_warnings.dart';

import '../../../domain/entities/warning.dart';

part 'warnings_event.dart';
part 'warnings_state.dart';

class WarningsBloc extends Bloc<WarningsEvent, WarningsState> {
  final GetAllWarningsUsecase getAllWarnings;

  WarningsBloc({
    required this.getAllWarnings,
  }) : super(WarningsInitial()) {
    on<WarningsEvent>((event, emit) async {
      if (event is GetAllWarningsEvent) {
        emit(LoadingWarningsState());
        final failureOrWarnings = await getAllWarnings();
        emit(_mapFailureOrWarningsToState(failureOrWarnings));
        
      } else if (event is RefreshWarningsEvent) {
        emit(LoadingWarningsState());
        final failureOrWarnings = await getAllWarnings();
        emit(_mapFailureOrWarningsToState(failureOrWarnings));
      }
    });
  }

  WarningsState _mapFailureOrWarningsToState(
      Either<Failure, List<Warning>> either) {
    return either.fold(
        (failure) => ErrorWarningsState(message: _mapFailureToMessage(failure)),
        (warnings) => LoadedWarningsState(
              warnings: warnings,
            ));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }
}
