import 'dart:async';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_case_study/app/state/app_state.dart';
import 'package:nodelabs_case_study/config/app_cache_value.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required AuthRepository authRepository,
    required CacheRepository cacheRepository,
  })  : _authRepository = authRepository,
        _cacheRepository = cacheRepository,
        super(SignInInitial()) {
    on<SignInRequest>(_onSignInRequested);
  }

  final AuthRepository _authRepository;
  final CacheRepository _cacheRepository;

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
      await _putTokenCache(loginResponse.token);
      emit(SignInCompleted());
    } on AuthException catch (e) {
      if (e is InvalidCredentials) {
        return emit(SignInInvalidCredentials());
      }
      emit(SignInUnknownError());
      rethrow;
    }
  }

  Future<void> _putTokenCache(String token) async {
    await _cacheRepository.put(
      value: JwtCache(
        value: token,
      ),
    );
    appState.value = appState.value.copyWith(isLoggedIn: true);
  }
}
