import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/shared_prefs.dart';
import '../../../data/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    /// Check if the user is already logged in
    on<CheckLoginStatus>((event, emit) async {
      final token = await SharedPrefs.getAuthToken();
      if (token != null) {
        emit(AuthSuccess(token: token));
      } else {
        emit(AuthFailure(error: "User not logged in"));
      }
    });

    /// Handle login event
    on<Login>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.login(event.identifier, event.password);
        final token = user.token;
        await SharedPrefs.saveAuthToken(token);
        emit(AuthSuccess(token: token));
      } catch (e) {
        emit(AuthFailure(error: e.toString(), isLoginAttempted: true));
      }
    });


    /// Handle logout event
    on<Logout>((event, emit) async {
      await SharedPrefs.clearAuthToken();
      emit(AuthInitial());
    });
  }
}
