import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final FirebaseDatabase _database = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL:
        "https://howbadami-25a13-default-rtdb.europe-west1.firebasedatabase.app/",
  );

  Future<void> create({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final DatabaseReference ref = _database.ref().child(path);
    await ref.set(data);
  }

  Future<DataSnapshot?> read({required String path}) async {
    final DatabaseReference ref = _database.ref().child(path);
    final DataSnapshot snapshot = await ref.get();
    return snapshot.exists ? snapshot : null;
  }

  Future<void> update({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final DatabaseReference ref = _database.ref().child(path);
    await ref.update(data);
  }

  Future<void> delete({required String path}) async {
    final DatabaseReference ref = _database.ref().child(path);
    await ref.remove();
  }

  Future<Map<String, dynamic>> get({required String pattern}) async {
    try {
      final DatabaseReference ref = _database.ref();
      final DataSnapshot snapshot = await ref.get();

      if (!snapshot.exists) {
        return {};
      }

      final Map<String, dynamic> allData = Map<String, dynamic>.from(
        snapshot.value as Map,
      );

      // Filter values containing the pattern
      final Map<String, dynamic> filtered = {};
      allData.forEach((key, value) {
        if (key.toLowerCase().contains(pattern.toLowerCase())) {
          filtered[key] = value;
        }
      });

      return filtered;
    } catch (e) {
      print('Error fetching data with pattern "$pattern": $e');
      return {};
    }
  }
}
