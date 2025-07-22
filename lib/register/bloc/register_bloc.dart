import 'dart:async';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:nodelabs_case_study/app/state/app_state.dart';
import 'package:nodelabs_case_study/config/app_cache_value.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required AuthRepository authRepository,
    required CacheRepository cacheRepository,
  })  : _authRepository = authRepository,
        _cacheRepository = cacheRepository,
        super(RegisterInitial()) {
    on<RegisterRequest>(_onRegisterRequest);
  }

  final AuthRepository _authRepository;
  final CacheRepository _cacheRepository;

  FutureOr<void> _onRegisterRequest(
    RegisterRequest event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(RegisterLoading());
      final registerResponse = await _authRepository.register(
        email: event.email,
        password: event.password,
        name: event.name,
      );
      await _putTokenCache(registerResponse.token);
      emit(RegisterCompleted());
    } on AuthException catch (e) {
      if (e is UserExists) {
        return emit(UserExistsError());
      }
      emit(RegisterUnknownError());
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
