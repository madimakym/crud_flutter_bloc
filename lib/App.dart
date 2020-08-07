import 'package:demo/page/user/listUserPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/user/user_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
      home: ListUserPage(),
    ),
    );
  }
}
