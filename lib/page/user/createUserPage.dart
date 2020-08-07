import 'package:demo/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  UserBloc _userBloc;

  TextEditingController firstname = new TextEditingController();
  TextEditingController lastname = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Add user'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          controller: firstname,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: ("firstname"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextField(
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          controller: lastname,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: ("lastname"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocListener<UserBloc, UserState>(
                    listener: (context, state) {
                      if (state is UserCreateSuccess) {
                        if (state.status == 201) {
                          _userBloc.add(UserGetStarted());
                          return Navigator.pop(context);
                        }
                      }
                    },
                    child: BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                      if (state is UserInProgress) {
                        return Text('Chargement');
                      }

                      return SizedBox(
                          width: 200,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MaterialButton(
                                elevation: 4.0,
                                onPressed: _connexion,
                                height: 45,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Text(
                                  "Create",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 22),
                                ),
                              )));
                    }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _connexion() async {
    _userBloc.add(
        UserCreateStarted(firstname: firstname.text, lastname: lastname.text));
  }
}