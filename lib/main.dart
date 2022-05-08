import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/apis/user_respository.dart';
import 'package:flutter_login/blocs/authentication_bloc.dart';
import 'package:flutter_login/blocs/login_bloc.dart';
import 'package:flutter_login/ui/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: UserRepository()),
        child: const LoginScreen(),
      ),
    );
  }
}

