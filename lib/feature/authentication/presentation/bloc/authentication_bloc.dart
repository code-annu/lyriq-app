import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:lyriq/feature/authentication/domain/usecase/continue_with_google_usecase.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final _continueWithGoogleUsecase = ContinueWithGoogleUsecase();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<ContinueWithGoogleButtonClickEvent>(_authenticateWithGoogle);
  }

  FutureOr<void> _authenticateWithGoogle(
    ContinueWithGoogleButtonClickEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(GoogleAuthenticatingState());
    try {
      final user = await _continueWithGoogleUsecase.execute();
      emit(GoogleAuthSuccessState());
    } catch (e) {
      emit(GoogleAuthFailedState());
    }
    emit(AuthCompletionState());
  }
}
