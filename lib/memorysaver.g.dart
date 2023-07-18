// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memorysaver.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MemorysaverData extends DataClass implements Insertable<MemorysaverData> {
  final int id;
  final String? title;
  final String? memoryDt;
  final String? picture;
  final String? notes;
  MemorysaverData(
      {required this.id, this.title, this.memoryDt, this.picture, this.notes});
  factory MemorysaverData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MemorysaverData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      memoryDt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}memory_dt']),
      picture: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}picture']),
      notes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notes']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String?>(title);
    }
    if (!nullToAbsent || memoryDt != null) {
      map['memory_dt'] = Variable<String?>(memoryDt);
    }
    if (!nullToAbsent || picture != null) {
      map['picture'] = Variable<String?>(picture);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String?>(notes);
    }
    return map;
  }

  MemorysaverCompanion toCompanion(bool nullToAbsent) {
    return MemorysaverCompanion(
      id: Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      memoryDt: memoryDt == null && nullToAbsent
          ? const Value.absent()
          : Value(memoryDt),
      picture: picture == null && nullToAbsent
          ? const Value.absent()
          : Value(picture),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory MemorysaverData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemorysaverData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String?>(json['title']),
      memoryDt: serializer.fromJson<String?>(json['memory_dt']),
      picture: serializer.fromJson<String?>(json['picture']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String?>(title),
      'memory_dt': serializer.toJson<String?>(memoryDt),
      'picture': serializer.toJson<String?>(picture),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  MemorysaverData copyWith(
          {int? id,
          String? title,
          String? memoryDt,
          String? picture,
          String? notes}) =>
      MemorysaverData(
        id: id ?? this.id,
        title: title ?? this.title,
        memoryDt: memoryDt ?? this.memoryDt,
        picture: picture ?? this.picture,
        notes: notes ?? this.notes,
      );
  @override
  String toString() {
    return (StringBuffer('MemorysaverData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('memoryDt: $memoryDt, ')
          ..write('picture: $picture, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, memoryDt, picture, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemorysaverData &&
          other.id == this.id &&
          other.title == this.title &&
          other.memoryDt == this.memoryDt &&
          other.picture == this.picture &&
          other.notes == this.notes);
}

class MemorysaverCompanion extends UpdateCompanion<MemorysaverData> {
  final Value<int> id;
  final Value<String?> title;
  final Value<String?> memoryDt;
  final Value<String?> picture;
  final Value<String?> notes;
  const MemorysaverCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.memoryDt = const Value.absent(),
    this.picture = const Value.absent(),
    this.notes = const Value.absent(),
  });
  MemorysaverCompanion.insert({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.memoryDt = const Value.absent(),
    this.picture = const Value.absent(),
    this.notes = const Value.absent(),
  });
  static Insertable<MemorysaverData> custom({
    Expression<int>? id,
    Expression<String?>? title,
    Expression<String?>? memoryDt,
    Expression<String?>? picture,
    Expression<String?>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (memoryDt != null) 'memory_dt': memoryDt,
      if (picture != null) 'picture': picture,
      if (notes != null) 'notes': notes,
    });
  }

  MemorysaverCompanion copyWith(
      {Value<int>? id,
      Value<String?>? title,
      Value<String?>? memoryDt,
      Value<String?>? picture,
      Value<String?>? notes}) {
    return MemorysaverCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      memoryDt: memoryDt ?? this.memoryDt,
      picture: picture ?? this.picture,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String?>(title.value);
    }
    if (memoryDt.present) {
      map['memory_dt'] = Variable<String?>(memoryDt.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String?>(picture.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String?>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemorysaverCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('memoryDt: $memoryDt, ')
          ..write('picture: $picture, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class Memorysaver extends Table with TableInfo<Memorysaver, MemorysaverData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Memorysaver(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _memoryDtMeta = const VerificationMeta('memoryDt');
  late final GeneratedColumn<String?> memoryDt = GeneratedColumn<String?>(
      'memory_dt', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _pictureMeta = const VerificationMeta('picture');
  late final GeneratedColumn<String?> picture = GeneratedColumn<String?>(
      'picture', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  late final GeneratedColumn<String?> notes = GeneratedColumn<String?>(
      'notes', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [id, title, memoryDt, picture, notes];
  @override
  String get aliasedName => _alias ?? 'memorysaver';
  @override
  String get actualTableName => 'memorysaver';
  @override
  VerificationContext validateIntegrity(Insertable<MemorysaverData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('memory_dt')) {
      context.handle(_memoryDtMeta,
          memoryDt.isAcceptableOrUnknown(data['memory_dt']!, _memoryDtMeta));
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemorysaverData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MemorysaverData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  Memorysaver createAlias(String alias) {
    return Memorysaver(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final Memorysaver memorysaver = Memorysaver(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [memorysaver];
}
