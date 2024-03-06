// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'category_name')
  final String? category_name;
  @JsonKey(name: 'banner_image')
  final String? banner_image;
  @JsonKey(name: 'priority')
  final String? priority;
  @JsonKey(name: 'status')
  final String? status;

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  const Category({
    this.id,
    this.category_name,
    this.banner_image,
    this.priority,
    this.status,
  });

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object?> get props => [
        id,
        category_name,
        banner_image,
        priority,
        status,
      ];
}
