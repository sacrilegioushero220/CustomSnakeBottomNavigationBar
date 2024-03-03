import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'aboutus.g.dart';

@JsonSerializable()
class Aboutus extends Equatable {
  final String? id;
  final String? title;
  @JsonKey(name: 'banner_image')
  final String? bannerImage;
  final String? description;

  const Aboutus({this.id, this.title, this.bannerImage, this.description});

  factory Aboutus.fromJson(Map<String, dynamic> json) {
    return _$AboutusFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AboutusToJson(this);

  @override
  List<Object?> get props => [id, title, bannerImage, description];
}
