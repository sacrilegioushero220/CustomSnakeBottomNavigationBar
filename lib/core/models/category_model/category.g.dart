// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String?,
      category_name: json['category_name'] as String?,
      banner_image: json['banner_image'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'category_name': instance.category_name,
      'banner_image': instance.banner_image,
      'priority': instance.priority,
      'status': instance.status,
    };
