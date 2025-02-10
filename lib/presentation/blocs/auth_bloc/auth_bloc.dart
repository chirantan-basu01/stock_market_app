import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/shared_prefs.dart';
import '../../../data/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        final user = await authRepository.login(event.email, event.password);
        await SharedPrefs.saveAuthToken(user.token);
        emit(AuthSuccess(token: user.token));
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
        log('Error in auth bloc : ${e.toString()}');
      }
    });
  }
}
