part of 'add_delete_update_warning_bloc.dart';

abstract class AddDeleteUpdateWarningState extends Equatable {
  const AddDeleteUpdateWarningState();
  
  @override
  List<Object> get props => [];
}

class AddDeleteUpdateWarningInitial extends AddDeleteUpdateWarningState {}


class LoadingAddDeleteUpdateWarningState extends AddDeleteUpdateWarningState{}

class ErrorAddDeleteUpdateWarningState extends AddDeleteUpdateWarningState{
  final String message;

  ErrorAddDeleteUpdateWarningState({required this.message});

   @override
  List<Object> get props => [message];
}

class MessageAddDeleteUpdateWarningState extends AddDeleteUpdateWarningState{
  final String message;

  MessageAddDeleteUpdateWarningState({required this.message});

  @override
  List<Object> get props => [message];
}
