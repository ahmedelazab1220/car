import 'package:car_help/features/settings/domain/entites/contact_information_entity.dart';

class ContactInformationModel extends ContactInformationEntity {
  ContactInformationModel({
    super.title,
    super.description,
    super.firstEmail,
    super.secondEmail,
    super.firstPhone,
    super.whatsappPhone,
    super.telegram,
    super.facebookLink,
    super.twitterLink,
    super.instagramLink,
    super.appleStoreLink,
    super.googlePlayLink,
  });

  factory ContactInformationModel.fromJson(Map<String, dynamic> json) {
    return ContactInformationModel(
      title: json['title'] as String?,
      description: json['description'] as String?,
      firstEmail: json['first_email'] as String?,
      secondEmail: json['second_email'] as String?,
      firstPhone: json['phone'] as String?,
      whatsappPhone: json['whatsapp'] as String?,
      telegram: json['telegram'] as String?,
      facebookLink: json['facebook_link'] as String?,
      twitterLink: json['twitter_link'] as String?,
      instagramLink: json['instagram_link'] as String?,
      googlePlayLink: json['google_play_link'] as String?,
      appleStoreLink: json['apple_store_link'] as String?,
    );
  }
  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'first_email': firstEmail,
        'second_email': secondEmail,
        'phone': firstPhone,
        'whatsapp': whatsappPhone,
        'telegram': telegram,
        'facebook_link': facebookLink,
        'twitter_link': twitterLink,
        'instagram_link': instagramLink,
        'google_play_link': googlePlayLink,
        'apple_store_link': appleStoreLink,
      };
}
