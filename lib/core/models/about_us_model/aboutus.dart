import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aboutus.g.dart';

@JsonSerializable()
class AboutUs extends Equatable {
  final String? id;
  final String? title;
  @JsonKey(name: 'banner_image')
  final String? bannerImage;
  final String? description;

  const AboutUs({this.id, this.title, this.bannerImage, this.description});

  factory AboutUs.fromJson(Map<String, dynamic> json) {
    return _$AboutUsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AboutUsToJson(this);

  @override
  List<Object?> get props => [id, title, bannerImage, description];
}
