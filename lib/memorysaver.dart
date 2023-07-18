import 'package:drift/drift.dart';
import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'memorysaver.g.dart';

@DriftDatabase(
  include: {'memorysaver.drift'},
)

class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<MemorysaverData>> getAllMemory() async {
    return await select(memorysaver).get();
  }

  Future<int> saveMemory(MemorysaverCompanion companion) async {
    return await into(memorysaver).insert(companion);
  }

  Future<int> deleteMemory(int id) async {
    return (delete(memorysaver)..where((val) => memorysaver.id.equals(id))).go();
  }

  Future<int> deleteAllMemory() async {
    return await delete(memorysaver).go();
  }

  Future<int> updateMemory(MemorysaverCompanion companion) async {
    return await update(memorysaver).write(MemorysaverCompanion(
      id: companion.id,
    ));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'memorysaver.db'));
    return NativeDatabase(file);
  });
}
