import 'dart:convert';

import 'package:hive/hive.dart';

part 'hive_db.g.dart';
@HiveType(typeId: 0)
class HiveDB {
  @HiveField(0)
  DateTime? date;

  HiveDB({
    this.date,
  });

  HiveDB copyWith({
    DateTime? date,
  }) {
    return HiveDB(
      date: date ?? this.date,
    );
  }
}
