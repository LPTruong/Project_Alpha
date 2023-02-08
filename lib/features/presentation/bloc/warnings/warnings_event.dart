part of 'warnings_bloc.dart';

abstract class WarningsEvent extends Equatable {
  const WarningsEvent();

  @override
  List<Object> get props => [];
}



class GetAllWarningsEvent extends WarningsEvent{

}
class RefreshWarningsEvent extends WarningsEvent{
  
}