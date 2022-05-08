import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/events/login_event.dart';
import 'package:flutter_login/states/login_state.dart';

import '../apis/user_respository.dart';
import 'authentication_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginInitial()) {
    on<LoginButtonPress>(onLoginButtonPress);
  }

  void onLoginButtonPress(LoginEvent event, Emitter emitter) async {
    if (event is LoginButtonPress) {

      print("Login Loading");
      emitter(LoginLoading());

      print("Login Get Token");
      final token = await userRepository.authenticate(username: event.username, password: event.password);

      print("Login Initial");
      emitter(LoginInitial());
    }
  }

}