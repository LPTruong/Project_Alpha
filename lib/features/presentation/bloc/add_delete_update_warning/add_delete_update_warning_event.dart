part of 'add_delete_update_warning_bloc.dart';

abstract class AddDeleteUpdateWarningEvent extends Equatable {
  const AddDeleteUpdateWarningEvent();

  @override
  List<Object> get props => [];
}

class AddWarningEvent extends AddDeleteUpdateWarningEvent {
  final Warning warning;

  AddWarningEvent({required this.warning});

  @override
  List<Object> get props => [warning];
}

class UpdateWarningEvent extends AddDeleteUpdateWarningEvent {
  final Warning warning;

  UpdateWarningEvent({required this.warning});

  @override
  List<Object> get props => [warning];
}

class DeleteWarningEvent extends AddDeleteUpdateWarningEvent {
  final String warningId;

  DeleteWarningEvent({required this.warningId});

  @override
  List<Object> get props => [warningId];
}
