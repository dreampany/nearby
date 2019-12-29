import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby/home/home_bloc.dart';
import 'package:nearby/home/home_state.dart';

/**
 * Created by roman on 2019-12-26
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: HomeWidget(screen: widget, state: this),
    );
  }
}

class HomeWidget extends StatelessWidget {
  final HomeScreen screen;
  final HomeScreenState state;

  const HomeWidget({Key key, @required this.screen, @required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby"),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<HomeBloc>(context),
          builder: (context, HomeState state) {

          },
      ),
    );
  }
}
