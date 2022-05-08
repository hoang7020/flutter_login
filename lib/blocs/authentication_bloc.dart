import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/apis/user_respository.dart';
import 'package:flutter_login/events/authentication_event.dart';
import 'package:flutter_login/states/authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({required this.userRepository})
      : assert(userRepository != null),
        super(AuthenticationUninitialized()) {
    on<LoggedIn>(loggedIn);
  }

  void loggedIn(AuthenticationEvent event, Emitter emitt) async {
    emit(AuthenticationLoading());
    if (event is LoggedIn) {
      await userRepository.persistToken(event.token);
    }
    emit(AuthenticationAuthenticated());
  }
}
