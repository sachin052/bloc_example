part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object> get props => [];
}
class  Loading extends HomeScreenState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class NumberChanged extends HomeScreenState{
  final String number;

  NumberChanged(this.number);
  @override
  // TODO: implement props
  List<Object> get props => [number];

}
