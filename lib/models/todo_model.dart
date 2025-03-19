import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class TodoModel extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? status;

  TodoModel({
    this.title,
    this.description,
    this.status,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}
