import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(NumberChanged("2"));

  @override
  Stream<HomeScreenState> mapEventToState(
    HomeScreenEvent event,
  ) async* {
    if(event is IncrementNumber){
      yield Loading();
      await Future.delayed(Duration(seconds: 1));
      yield NumberChanged(event.number);
    }
    else if (event is DecrementNumber){
      yield Loading();
      await Future.delayed(Duration(seconds: 1));
      yield NumberChanged(event.number);
    }
  }
  String incrimentNUmber(String number){
    return (int.tryParse(number)+1).toString();
  }

  String decrementNumber(String number){
    return (int.tryParse(number)-1).toString();
  }
}
