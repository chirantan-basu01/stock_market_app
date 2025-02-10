import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckLoginStatus extends AuthEvent {}

class Login extends AuthEvent {
  final String identifier;
  final String password;

  Login({required this.identifier, required this.password});

  @override
  List<Object?> get props => [identifier, password];
}

class Logout extends AuthEvent {}
