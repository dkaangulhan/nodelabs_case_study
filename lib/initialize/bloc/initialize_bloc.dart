import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:nodelabs_case_study/config/app_cache_boxes.dart';

part 'initialize_event.dart';
part 'initialize_state.dart';

class InitializeBloc extends Bloc<InitializeEvent, InitializeState> {
  InitializeBloc({
    required CacheRepository cacheRepository,
  })  : _cacheRepository = cacheRepository,
        super(InitializeInitial()) {
    on<InitializeApp>(_onInitializeApp);
  }

  final CacheRepository _cacheRepository;

  FutureOr<void> _onInitializeApp(
    InitializeApp event,
    Emitter<InitializeState> emit,
  ) async {
    await _cacheRepository.initializeCache(boxes: AppCacheBox.cacheBoxes);
    emit(Success());
  }
}
