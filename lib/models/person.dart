import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final int id;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;

  Person(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.dateOfBirth});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
