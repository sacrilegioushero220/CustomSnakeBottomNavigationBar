// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      id: json['id'] as String?,
      category: json['category'] as String?,
      subCategory: json['sub_category'] as String?,
      videoTitle: json['video_title'] as String?,
      postedBy: json['posted_by'] as String?,
      videoDescription: json['video_description'] as String?,
      videos: json['videos'] as String?,
      videoImage: json['video_image'] as String?,
      videoId: json['video_id'] as String?,
      homeDisplay: json['home_display'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as bool?,
      categoryName: json['category_name'] as String?,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'sub_category': instance.subCategory,
      'video_title': instance.videoTitle,
      'posted_by': instance.postedBy,
      'video_description': instance.videoDescription,
      'videos': instance.videos,
      'video_image': instance.videoImage,
      'video_id': instance.videoId,
      'home_display': instance.homeDisplay,
      'priority': instance.priority,
      'status': instance.status,
      'category_name': instance.categoryName,
    };
