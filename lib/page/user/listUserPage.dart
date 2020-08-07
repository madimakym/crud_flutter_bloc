import 'dart:convert';
import 'package:demo/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'createUserPage.dart';

class ListUserPage extends StatefulWidget {
  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  UserBloc _userBloc;
  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.add(UserGetStarted());
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Bloc Pattern'),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                BlocProvider.of<UserBloc>(context);
                if (state is UserInProgress) {
                  return Center(child: Text('Waiting...'));
                }

                if (state is UserGetSuccess) {
                  var data = (jsonDecode(state.data));
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data == null ? 0 : data.length,
                    itemBuilder: (ctx, i) {
                      return SizedBox(
                          child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]),
                          color: Colors.white,
                        ),
                        child: ListTile(
                          title: Text(
                            data[i]['firstname'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              data[i]['lastname'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          ),
                          trailing: Icon(Icons.chevron_right,
                              color: Colors.black, size: 30),
                        ),
                      ));
                    },
                  );
                }
                return Center(child: Text('data not found'));
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePage()),
          );
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
