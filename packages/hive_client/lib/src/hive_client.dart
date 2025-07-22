import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// {@template hive_client}
/// Cache client that uses hive package.
/// {@endtemplate}
class HiveClient {
  /// {@macro hive_client}
  const HiveClient();

  /// This will initialize hive boxes.
  Future<void> initialize({
    required List<String> boxes,
  }) async {
    final docDir = await getApplicationDocumentsDirectory();
    Hive.init(docDir.path);

    /// This method is used to open the hive boxes
    await Future.wait(
      List.generate(boxes.length, (index) {
        return Hive.openBox<String>(boxes[index]);
      }),
    );
  }

  /// This method is used to put a value in the hive box
  Future<void> put({
    required String box,
    required String key,
    required String value,
  }) async {
    final hiveBox = Hive.box<String>(box);
    await hiveBox.put(key, value);
  }

  /// This method is used to get a value from the hive box
  String? get({required String box, required String key}) {
    final hiveBox = Hive.box<String>(box);
    return hiveBox.get(key);
  }

  /// This method is used to get all values from the hive box
  List<String> getAll({required String box}) {
    final hiveBox = Hive.box<String>(box);
    return hiveBox.values.toList().cast<String>();
  }

  /// This method is used to delete a value from the hive box
  Future<void> delete({required String box, required String key}) async {
    final hiveBox = Hive.box<String>(box);
    await hiveBox.delete(key);
  }

  /// This method is used to clear the hive box
  Future<void> clear({required String box}) async {
    final hiveBox = Hive.box<String>(box);
    await hiveBox.clear();
  }
}
