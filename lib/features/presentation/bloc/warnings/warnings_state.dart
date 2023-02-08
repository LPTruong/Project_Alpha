part of 'warnings_bloc.dart';

abstract class WarningsState extends Equatable {
  const WarningsState();

  @override
  List<Object> get props => [];
}

class WarningsInitial extends WarningsState {}

class LoadingWarningsState extends WarningsState {}

class LoadedWarningsState extends WarningsState {
  final List<Warning> warnings;

  LoadedWarningsState({required this.warnings});

  @override
  List<Object> get props => [warnings];
}

class ErrorWarningsState extends WarningsState{
  final String message;

  ErrorWarningsState({required this.message});

    @override
  List<Object> get props => [message];
}