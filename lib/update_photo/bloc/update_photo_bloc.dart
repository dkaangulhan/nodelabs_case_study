import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cache_repository/cache_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:external_media_repository/external_media_repository.dart';
import 'package:nodelabs_case_study/config/app_cache_value.dart';
import 'package:user_repository/user_repository.dart';

part 'update_photo_event.dart';
part 'update_photo_state.dart';

class UpdatePhotoBloc extends Bloc<UpdatePhotoEvent, UpdatePhotoState> {
  UpdatePhotoBloc({
    required ExternalMediaRepository externalMediaRepository,
    required UserRepository userRepository,
    required CacheRepository cacheRepository,
  })  : _externalMediaRepository = externalMediaRepository,
        _userRepository = userRepository,
        _cacheRepository = cacheRepository,
        super(const UpdatePhotoState(pickedImage: null)) {
    on<PickImage>(_onPickImage);
    on<UpdatePhoto>(_updatePhoto);
  }

  final ExternalMediaRepository _externalMediaRepository;
  final UserRepository _userRepository;
  final CacheRepository _cacheRepository;

  FutureOr<void> _onPickImage(
    PickImage event,
    Emitter<UpdatePhotoState> emit,
  ) async {
    final pickedImage = await _externalMediaRepository.pickImage();
    if (pickedImage == null) {
      return;
    }
    emit(UpdatePhotoState(pickedImage: pickedImage));
  }

  FutureOr<void> _updatePhoto(
    UpdatePhoto event,
    Emitter<UpdatePhotoState> emit,
  ) async {
    try {
      emit(PhotoUploadingState(pickedImage: state.pickedImage));
      await _userRepository.updatePhoto(state.pickedImage!);
      await _updateCache();
      emit(PhotoUploadedState(pickedImage: state.pickedImage));
    } on EntityTooLargeException catch (e) {
      emit(PhotoUploadError(pickedImage: state.pickedImage, error: e));
    }
  }

  Future<void> _updateCache() async {
    final userInRepository = _userRepository.user!;
    await _cacheRepository.put(
      value: UserCache.toCache(userInRepository),
    );
  }
}
