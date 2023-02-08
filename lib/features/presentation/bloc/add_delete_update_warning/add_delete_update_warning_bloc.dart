import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:project_alpha/core/error/failures.dart';
import 'package:project_alpha/core/strings/messages.dart';
import 'package:project_alpha/features/domain/entities/warning.dart';
import 'package:project_alpha/features/domain/usecases/add_warning.dart';
import 'package:project_alpha/features/domain/usecases/delete_warning.dart';
import 'package:project_alpha/features/domain/usecases/update_warning.dart';

import '../../../../core/strings/failures.dart';

part 'add_delete_update_warning_event.dart';
part 'add_delete_update_warning_state.dart';

class AddDeleteUpdateWarningBloc
    extends Bloc<AddDeleteUpdateWarningEvent, AddDeleteUpdateWarningState> {
  final AddWarningUseCase addWarning;
  final DeleteWarningUseCase deleteWarning;
  final UpdateWarningUseCase updateWarning;
  AddDeleteUpdateWarningBloc({
    required this.addWarning,
    required this.updateWarning,
    required this.deleteWarning,
  }) : super(AddDeleteUpdateWarningInitial()) {
    on<AddDeleteUpdateWarningEvent>((event, emit) async {
      if (event is AddWarningEvent) {
        emit(LoadingAddDeleteUpdateWarningState());
        final failureOrDoneMessage = await addWarning(event.warning);
        // failureOrDoneMessage.fold(
        //     (failure) => {
        //           emit(ErrorAddDeleteUpdateWarningState(
        //               message: _mapFailureToMessage(failure)))
        //         },
        //     (_) => {
        //           emit(
        //             MessageAddDeleteUpdateWarningState(
        //                 message: UPDATE_SUCCESS_MESSAGE),
        //           )
        //         });
        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, ADD_SUCCESS_MESSAGE),
        );
      } else if (event is UpdateWarningEvent) {
        emit(LoadingAddDeleteUpdateWarningState());
        final failureOrDoneMessage = await updateWarning(event.warning);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, UPDATE_SUCCESS_MESSAGE),
        );

        
      } else if (event is DeleteWarningEvent) {
        emit(LoadingAddDeleteUpdateWarningState());
        final failureOrDoneMessage = await deleteWarning(event.warningId);

        emit(
          _eitherDoneMessageOrErrorState(
              failureOrDoneMessage, DELETE_SUCCES_MESSAGE),
        );
      }
    });
  }

  AddDeleteUpdateWarningState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
        (failure) => ErrorAddDeleteUpdateWarningState(
            message: _mapFailureToMessage(failure)),
        (_) => MessageAddDeleteUpdateWarningState(message: message));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, Please try again later.";
    }
  }
}
