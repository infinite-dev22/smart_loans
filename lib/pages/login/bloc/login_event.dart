part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LogInUser extends LoginEvent {
  LogInUser(this.email, this.password);

  final String email;
  final String password;

  @override
  List<Object?> get props => [email.trim(), password.trim()];
}

class RememberUser extends LoginEvent {
  RememberUser(this.rememberUser);

  final bool rememberUser;

  @override
  List<Object?> get props => [rememberUser];
}

class SuccessfullyLoggedIn extends LoginEvent {}

class Success extends LoginEvent {}
