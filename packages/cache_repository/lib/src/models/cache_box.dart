/// Box that can be used for storing key/value pairs in.
abstract class CacheBox {
  /// Name of the box.
  String get boxName;

  /// if the values inside box is encrypted.
  bool get encrypted => false;

  /// This is the key for encrypting data.
  String? get encryptionKey => null;
}
