import 'dart:async';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(SignInInitial()) {
    on<SignInRequest>(_onSignInRequested);
  }

  final AuthRepository _authRepository;

  FutureOr<void> _onSignInRequested(
    SignInRequest event,
    Emitter<SignInState> emit,
  ) async {
    try {
      emit(SignInLoading());
      final loginResponse = await _authRepository.login(
        email: event.email,
        password: event.password,
      );
      // TODO(dkaan): save token local safe.
      emit(SignInCompleted());
    } on AuthException catch (e) {
      if (e is InvalidCredentials) {
        return emit(SignInInvalidCredentials());
      }
      emit(SignInUnknownError());
      rethrow;
    }
  }
}
