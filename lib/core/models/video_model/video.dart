import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class Video extends Equatable {
  final String? id;
  final String? category;
  @JsonKey(name: 'video_title')
  final String? videoTitle;
  @JsonKey(name: 'posted_by')
  final String? postedBy;
  @JsonKey(name: 'video_description')
  final String? videoDescription;
  @JsonKey(name: 'video_path')
  final String? videos;
  @JsonKey(name: 'video_image')
  final String? videoImage;
  @JsonKey(name: 'home_display')
  final String? homeDisplay;
  @JsonKey(name: 'priority')
  final String? priority;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'category_name')
  final String? categoryName;

  const Video({
    this.id,
    this.category,
    this.videoTitle,
    this.postedBy,
    this.videoDescription,
    this.videos,
    this.videoImage,
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
      videoTitle,
      postedBy,
      videoDescription,
      videos,
      videoImage,
      homeDisplay,
      priority,
      status,
      categoryName,
    ];
  }
}
