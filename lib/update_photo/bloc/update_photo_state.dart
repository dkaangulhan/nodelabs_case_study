part of 'update_photo_bloc.dart';

class UpdatePhotoState extends Equatable {
  const UpdatePhotoState({
    required this.pickedImage,
  });

  final File? pickedImage;

  @override
  List<Object?> get props => [pickedImage];

  UpdatePhotoState copyWith({
    File? pickedImage,
  }) {
    return UpdatePhotoState(
      pickedImage: pickedImage ?? this.pickedImage,
    );
  }
}

class PhotoUploadingState extends UpdatePhotoState {
  const PhotoUploadingState({required super.pickedImage});

  @override
  List<Object?> get props => [pickedImage];
}

class PhotoUploadedState extends UpdatePhotoState {
  const PhotoUploadedState({required super.pickedImage});

  @override
  List<Object?> get props => [pickedImage];
}

class PhotoUploadError extends UpdatePhotoState {
  const PhotoUploadError({
    required super.pickedImage,
    required this.error,
  });

  final Object error;

  @override
  List<Object?> get props => [pickedImage, error];
}
