import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video extends Equatable {
  final String? id;
  final String? category;
  @JsonKey(name: 'sub_category')
  final String? subCategory;
  @JsonKey(name: 'video_title')
  final String? videoTitle;
  @JsonKey(name: 'posted_by')
  final String? postedBy;
  @JsonKey(name: 'video_description')
  final String? videoDescription;
  final String? videos;
  @JsonKey(name: 'video_image')
  final String? videoImage;
  @JsonKey(name: 'video_id')
  final String? videoId;
  @JsonKey(name: 'home_display')
  final String? homeDisplay;
  final String? priority;
  final bool? status;
  @JsonKey(name: 'category_name')
  final String? categoryName;

  const Video({
    this.id,
    this.category,
    this.subCategory,
    this.videoTitle,
    this.postedBy,
    this.videoDescription,
    this.videos,
    this.videoImage,
    this.videoId,
    this.homeDisplay,
    this.priority,
    this.status,
    this.categoryName,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      category,
      subCategory,
      videoTitle,
      postedBy,
      videoDescription,
      videos,
      videoImage,
      videoId,
      homeDisplay,
      priority,
      status,
      categoryName,
    ];
  }
}
