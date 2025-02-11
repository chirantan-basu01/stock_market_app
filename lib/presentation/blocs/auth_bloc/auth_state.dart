import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String token;

  AuthSuccess({required this.token});

  @override
  List<Object?> get props => [token];
}

class AuthFailure extends AuthState {
  final String error;
  final bool isLoginAttempted;

  AuthFailure({required this.error, this.isLoginAttempted = false});

  @override
  List<Object?> get props => [error];
}
