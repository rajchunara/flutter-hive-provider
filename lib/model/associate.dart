import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

//Automatically generate file by hive generator
part 'associate.g.dart';

@HiveType(typeId: 0)
class Associate {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int phone;

  @HiveField(2)
  final bool isSenior;

  @HiveField(3)
  final DateTime joinDate;

  @HiveField(4)
  final int age;

  Associate(
      {@required this.name,
      this.phone,
      this.isSenior,
      this.joinDate,
      this.age});
}
