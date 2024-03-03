import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'category')
  final String? category;
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
    this.category,
    this.banner_image,
    this.priority,
    this.status,
  });

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object?> get props => [
        id,
        category,
        banner_image,
        priority,
        status,
      ];
}