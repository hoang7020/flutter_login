abstract class LoginEvent {}

class LoginButtonPress extends LoginEvent {

  final String username;
  final String password;

  LoginButtonPress({required this.username, required this.password});

}