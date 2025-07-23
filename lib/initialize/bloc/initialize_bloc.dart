import 'dart:async';
import 'dart:convert';

import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:nodelabs_case_study/app/state/app_state.dart';
import 'package:nodelabs_case_study/config/app_cache_boxes.dart';
import 'package:nodelabs_case_study/config/app_cache_value.dart';
import 'package:user_repository/user_repository.dart';

part 'initialize_event.dart';
part 'initialize_state.dart';

class InitializeBloc extends Bloc<InitializeEvent, InitializeState> {
  InitializeBloc({
    required CacheRepository cacheRepository,
    required AuthRepository authRepository,
    required UserRepository userRepository,
    required MovieRepository movieRepository,
  })  : _cacheRepository = cacheRepository,
        _authRepository = authRepository,
        _userRepository = userRepository,
        _movieRepository = movieRepository,
        super(InitializeInitial()) {
    on<InitializeApp>(_onInitializeApp);
  }

  final CacheRepository _cacheRepository;
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final MovieRepository _movieRepository;

  FutureOr<void> _onInitializeApp(
    InitializeApp event,
    Emitter<InitializeState> emit,
  ) async {
    await _cacheRepository.initializeCache(boxes: AppCacheBox.cacheBoxes);
    await _getAuthToken();
    await _getUser();
    await _getFavoriteMovies();
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

  Future<void> _getUser() async {
    if (_authRepository.token == null) {
      return;
    }
    final user = await _cacheRepository.getData(
      box: UserCacheBox(),
      key: UserCache.keyValue,
    );
    _userRepository.user = User.fromJson(
      jsonDecode(user!) as Map<String, dynamic>,
    );
  }

  Future<void> _getFavoriteMovies() async {
    if (_authRepository.token == null) {
      return;
    }
    await _movieRepository.getFavoriteMovies();
  }
}
