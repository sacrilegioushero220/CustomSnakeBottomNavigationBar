import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contactus.g.dart';

@JsonSerializable()
class ContactUs extends Equatable {
  final String? id;
  @JsonKey(name: 'page_heading')
  final String? pageHeading;
  @JsonKey(name: 'banner_image')
  final String? bannerImage;
  final String? address;
  final String? email;
  final String? phone;
  final String? mobile;
  @JsonKey(name: 'google_map')
  final String? googleMap;
  final String? description;
  @JsonKey(name: 'instagram_link')
  final String? instagramLink;
  @JsonKey(name: 'facebook_link')
  final String? facebookLink;
  @JsonKey(name: 'youtube_link')
  final String? youtubeLink;

  const ContactUs({
    this.id,
    this.pageHeading,
    this.bannerImage,
    this.address,
    this.email,
    this.phone,
    this.mobile,
    this.googleMap,
    this.description,
    this.instagramLink,
    this.facebookLink,
    this.youtubeLink,
  });

  factory ContactUs.fromJson(Map<String, dynamic> json) {
    return _$ContactUsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContactUsToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      pageHeading,
      bannerImage,
      address,
      email,
      phone,
      mobile,
      googleMap,
      description,
      instagramLink,
      facebookLink,
      youtubeLink,
    ];
  }
}
