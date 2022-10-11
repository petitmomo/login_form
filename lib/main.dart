import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/dashboard/home.dart';
import 'screens/guest.dart';
import 'services/UserServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  UserService _userService = UserService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      title: "LoginForm",
      home: StreamBuilder(
        stream: _userService.user,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              return HomeScreen();
            }
            return GuestScreen();
          }
          return Scaffold(
            body: Center(
              child: Text("Loading..."),
            ),
          );
        }
      ),
    );
  }
}
