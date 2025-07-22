import 'dart:async';
import 'dart:convert';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_case_study/app/state/app_state.dart';
import 'package:nodelabs_case_study/config/app_cache_value.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    required AuthRepository authRepository,
    required CacheRepository cacheRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _cacheRepository = cacheRepository,
        _userRepository = userRepository,
        super(SignInInitial()) {
    on<SignInRequest>(_onSignInRequested);
  }

  final AuthRepository _authRepository;
  final CacheRepository _cacheRepository;
  final UserRepository _userRepository;

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
      await _putUser(loginResponse);
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

  Future<void> _putUser(LoginResponse loginResponse) async {
    final user = User(
      id: loginResponse.id,
      name: loginResponse.name,
      email: loginResponse.email,
      photoUrl: loginResponse.photoUrl,
    );
    _userRepository.user = user;
    await _cacheRepository.put(
      value: UserCache(value: jsonEncode(user.toJson())),
    );
  }
}
