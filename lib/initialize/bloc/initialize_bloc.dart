import 'dart:async';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_case_study/app/state/app_state.dart';
import 'package:nodelabs_case_study/config/app_cache_boxes.dart';
import 'package:nodelabs_case_study/config/app_cache_value.dart';

part 'initialize_event.dart';
part 'initialize_state.dart';

class InitializeBloc extends Bloc<InitializeEvent, InitializeState> {
  InitializeBloc({
    required CacheRepository cacheRepository,
    required AuthRepository authRepository,
  })  : _cacheRepository = cacheRepository,
        _authRepository = authRepository,
        super(InitializeInitial()) {
    on<InitializeApp>(_onInitializeApp);
  }

  final CacheRepository _cacheRepository;
  final AuthRepository _authRepository;

  FutureOr<void> _onInitializeApp(
    InitializeApp event,
    Emitter<InitializeState> emit,
  ) async {
    await _cacheRepository.initializeCache(boxes: AppCacheBox.cacheBoxes);
    await _getAuthToken();
    emit(Success(isAuthenticated: _authRepository.token != null));
  }

  Future<void> _getAuthToken() async {
    final jwt = await _cacheRepository.getData(
      box: SecureCacheBox(),
      key: JwtCache.keyValue,
    );
    _authRepository.putToken(jwt);
    if (jwt != null) {
      appState.value = appState.value.copyWith(
        isLoggedIn: true,
      );
    }
  }
}
