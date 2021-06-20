part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}
class IncrementNumber extends HomeScreenEvent{
  final String number;
  IncrementNumber(this.number);
  @override
  // TODO: implement props
  List<Object> get props => [number];

}

class DecrementNumber extends HomeScreenEvent{
  final String number;
  DecrementNumber(this.number);
  @override
  // TODO: implement props
  List<Object> get props => [number];
}