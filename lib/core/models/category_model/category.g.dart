// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String?,
      category: json['category'] as String?,
      bannerImage: json['bannerImage'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'bannerImage': instance.bannerImage,
      'priority': instance.priority,
      'status': instance.status,
    };
