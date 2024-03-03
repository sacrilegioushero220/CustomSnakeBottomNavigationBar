// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUs _$ContactUsFromJson(Map<String, dynamic> json) => ContactUs(
      id: json['id'] as String?,
      pageHeading: json['page_heading'] as String?,
      bannerImage: json['banner_image'] as String?,
      address: json['address'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      mobile: json['mobile'] as String?,
      googleMap: json['google_map'] as String?,
      description: json['description'] as String?,
      instagramLink: json['instagram_link'] as String?,
      facebookLink: json['facebook_link'] as String?,
      youtubeLink: json['youtube_link'] as String?,
    );

Map<String, dynamic> _$ContactUsToJson(ContactUs instance) => <String, dynamic>{
      'id': instance.id,
      'page_heading': instance.pageHeading,
      'banner_image': instance.bannerImage,
      'address': instance.address,
      'email': instance.email,
      'phone': instance.phone,
      'mobile': instance.mobile,
      'google_map': instance.googleMap,
      'description': instance.description,
      'instagram_link': instance.instagramLink,
      'facebook_link': instance.facebookLink,
      'youtube_link': instance.youtubeLink,
    };
