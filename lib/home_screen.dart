import 'package:bloc_example/bloc/home_screen_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenBloc homeScreenBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeScreenBloc = HomeScreenBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      bloc: homeScreenBloc,
      builder: (context, state) {
        return Scaffold(appBar: AppBar(title: Text("Bloc Example"),),
          body: mapStateToWidget(state),
        );
      },
    );
  }

  Widget mapStateToWidget(HomeScreenState state) {
    if(state is Loading)return Center(child: CircularProgressIndicator());
    else if(state is NumberChanged)return Stack(
      children: [
        Center(child: Text(state.number,style: TextStyle(fontSize: 32),),),
        Positioned(
        bottom: 20,
          right: 20,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FloatingActionButton(child: Icon(Icons.add), onPressed: (){
                if(state is NumberChanged)
                  homeScreenBloc.add(IncrementNumber(homeScreenBloc.incrimentNUmber(state.number)));
              }),
              SizedBox(width: 10,),
              FloatingActionButton(
                  child: Icon(Icons.remove), onPressed: (){
                if(state is NumberChanged)
                  homeScreenBloc.add(IncrementNumber(homeScreenBloc.decrementNumber(state.number)));
              }),
            ],
          ),
        )
      ],
    );
    return SizedBox();

  }
}
