import 'dart:async';
import 'dart:convert';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:nodelabs_case_study/app/state/app_state.dart';
import 'package:nodelabs_case_study/config/app_cache_value.dart';
import 'package:user_repository/user_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required AuthRepository authRepository,
    required CacheRepository cacheRepository,
    required UserRepository userRepository,
  })  : _authRepository = authRepository,
        _cacheRepository = cacheRepository,
        _userRepository = userRepository,
        super(RegisterInitial()) {
    on<RegisterRequest>(_onRegisterRequest);
  }

  final AuthRepository _authRepository;
  final CacheRepository _cacheRepository;
  final UserRepository _userRepository;

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
      await _putUser(registerResponse);
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

  Future<void> _putUser(RegisterResponse registerResponse) async {
    final user = User(
      id: registerResponse.id,
      name: registerResponse.name,
      email: registerResponse.email,
      photoUrl: registerResponse.photoUrl,
    );
    _userRepository.user = user;
    await _cacheRepository.put(
      value: UserCache(value: jsonEncode(user.toJson())),
    );
  }
}
