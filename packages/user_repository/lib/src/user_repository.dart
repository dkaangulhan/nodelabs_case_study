import 'dart:io';

import 'package:api_client/api_client.dart';
import 'package:rxdart/subjects.dart';
import 'package:user_repository/src/models/user.dart';
import 'package:user_repository/src/models/user_update_event.dart';

/// {@template user_repository}
/// User Repository.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  UserRepository(this._apiClient);

  final ApiClient _apiClient;

  /// The user.
  User? user;

  final _userUpdateSubject = PublishSubject<UserUpdateEvent>();

  /// Stream of UserUpdateEvent
  Stream<UserUpdateEvent> get userUpdateStream => _userUpdateSubject.stream;

  /// This updates user's photo with provided file.
  Future<void> updatePhoto(File file) async {
    final photoUrl = await _apiClient.uploadPhoto(file: file);
    user = user?.copyWith(photoUrl: photoUrl);
    _userUpdateSubject.add(UserUpdateEvent());
  }
}
