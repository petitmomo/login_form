import 'package:flutter/material.dart';

import '../model/UserModel.dart';
import '../services/UserServices.dart';
import '../services/commonService.dart';
import 'dashboard/home.dart';
import 'guest/auth.dart';
import 'guest/password.dart';
import 'guest/term.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  _GuestScreenState createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  CommonService _commonService = CommonService();
  UserService _userService = UserService();

  List<Widget> widgets = [];
  int indexSelected = 0;

  late String _email;
  late String _password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _commonService.terms.then((terms) => setState(
          () => widgets.addAll([
            AuthScreen(
              onChangeSteps: (index, value) => setState(() {
                indexSelected = index;
                _email = value;
                _password = value;
              }),
            ),
            TermScreen(
                terms: terms,
                onChangeSteps: (index) =>
                    setState(() => indexSelected = index)),
            PasswordScreen(
              onChangeSteps: (index, value) => setState(() {
                if (index != null) {
                  indexSelected = index;
                }

                if (value != null) {
                  _userService
                      .auth(UserModel(
                    email: _email,
                    password: value,
                  ))
                      .then((value) {
                    if (value.uid != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  });
                }
              }),
            ),
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widgets.length == 0
          ? SafeArea(
              child: Scaffold(
                body: Center(
                  child: Text("Loading"),
                ),
              ),
            )
          : widgets.elementAt(indexSelected),
    );
  }
}
