import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:shamz_ai/app_exports.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationProvider authenticationProvider;

  LoginBloc({
    AuthenticationProvider? authenticationProvider,
  }) : authenticationProvider = authenticationProvider ?? AuthenticationProvider(), super(LoginInitial()) {
    on<LoginButtonPressed>(_handleLogin);
    on<SignUpButtonPressed>(_handleSignUp);
    on<AuthStarted>(_handleAuthStarted);
    on<VerifyEmailButtonPressed>(_handleVerifyEmail);
    on<LoginSuccessEvent>(_handleSuccess);
  }

  Future<void> _handleSuccess(
      LoginSuccessEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoginInProgress());
   // Handle login logic
   //    emit(LoginSuccess(
   //        user: UserModel.fromFirestore(
   //            userDoc.data() as Map<String, dynamic>)));
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }

  _handleVerifyEmail(
      VerifyEmailButtonPressed event, Emitter<LoginState> emit) async {
    try {
      emit(LoginInProgress());
     // Handle verify email logic
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }

  Future<void> _handleAuthStarted(
      AuthStarted event, Emitter<LoginState> emit) async {
    emit(LoginInitial());
    try {
    // Handle auth started logic
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }

  Future<void> _handleLogin(
      LoginButtonPressed event, Emitter<LoginState> emit) async {

    try {
      emit(LoginInProgress());
     // Handle login logic
    }  catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }

  Future<void> _handleSignUp(
      SignUpButtonPressed event, Emitter<LoginState> emit) async {
    try {
      emit(LoginInProgress());
      // Handle sign up logic
    }  catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}
