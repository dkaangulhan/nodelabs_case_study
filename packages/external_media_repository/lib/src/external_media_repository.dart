import 'dart:io';

import 'package:image_picker/image_picker.dart';

/// {@template external_media_repository}
/// Repository for interact with external data like
/// images on gallery, etc.
/// {@endtemplate}
class ExternalMediaRepository {
  /// {@macro external_media_repository}
  const ExternalMediaRepository();

  /// Picks an image from gallery.
  Future<File?> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return null;
    }
    return File(pickedImage.path);
  }
}
