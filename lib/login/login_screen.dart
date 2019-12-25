import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby/login/login_bloc.dart';
import 'package:nearby/login/login_state.dart';

/**
 * Created by roman on 2019-12-23
 * Copyright (c) 2019 bjit. All rights reserved.
 * hawladar.roman@bjitgroup.com
 * Last modified $file.lastModified
 */
class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(),
      child: LoginWidget(formKey: formKey, screen: widget, state: this),
    );
  }
}

class LoginWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final LoginScreen screen;
  final LoginScreenState state;
  final TextEditingController nameController;

  const LoginWidget(
      {Key key,
      @required this.formKey,
      @required this.nameController,
      @required this.screen,
      @required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<LoginBloc>(context),
        builder: (context, LoginState state) =>
            getLoginUi(formKey, nameController, context, state),
      ),
    );
  }
}

Widget getLoginUi(
    GlobalKey<FormState> formKey, TextEditingController nameController, BuildContext context, LoginState state) {
  if (state.loading)
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 4.0,
      ),
    );
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Enter your username'),
                  validator: (value) {
                    if (value.isEmpty) return 'Please enter username';
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      login(formKey, context, nameController);
                    },
                    child: Text('Login with name'),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

void login(GlobalKey<FormState> key, BuildContext context, TextEditingController controller) {
  if (key.currentState.validate()) {
    Scaffold.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 2), content: Text('Login...')));
    String name = controller.text;
    BlocProvider.of<LoginBloc>(context).loginOnUser(context, name);
  }
}
