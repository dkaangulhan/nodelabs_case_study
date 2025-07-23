part of 'update_photo_bloc.dart';

sealed class UpdatePhotoEvent extends Equatable {
  const UpdatePhotoEvent();

  @override
  List<Object> get props => [];
}

class PickImage extends UpdatePhotoEvent {}

class UpdatePhoto extends UpdatePhotoEvent {}
