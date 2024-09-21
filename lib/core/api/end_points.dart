class EndPoints {
  /////////////// Auth User  ////////////////
  static const String userLogin = "/auth/login";
  static const String registerUser = "/auth/register";
  static const String sendOtpUser = "/auth/send-otp";
  static const String verifyOtp = "/auth/verify-otp";
  static const String updateRegisterData = "/auth/update-user/";

  /////////////// Contact Us  ////////////////
  static const String contactUs = "/contact-us";
  static const String getContactUs = "/app-settings";
  static const String getFAQ = "/faq-questions";

  /////////////// Profile User  ////////////////
  static const String userData = "/profile/me";
  static const String logOutUser = "/profile/logout";
  static const String updateUserData = "/profile/update";
  static const String sendOtpEditPhone = "/profile/send-otp";
  static const String verifyOtpEditPhone = "/profile/verify-otp";
  static const String deleteAccount = "/profile/delete-account";
  static const String getHomeProviderData = '/home';
  static const String plans = '/plans';
  static const String planSubscriptions = '/plan-subscriptions';

  /////////////// Notification  ////////////////
  static const String notification = '/notification';
  static const String markAllAsRead = '/mark-all-notifications-as-read';
  static const String toggleNotification = '/profile/update-notification';

  /////////////// Pages  ////////////////
  static const String getPrivacyPolicy = '/pages/3';
  static const String getTermsAndConditions = '/pages/2';
  static const String getAboutUs = '/pages/1';

  /////////////// Services  ////////////////
  static const String getServices = '/categories';
  static const String getBannerCategories = '/banner-categories';
  static const String getHome = '/home';
  static const String getPrograms = '/programs';
  static const String getProviders = '/providers?categories[]=';
  static const String getSingleProvider = '/providers/';
  static const String search = '/search?search=';
  static const String getFavorite = '/client/wishlists';
  static const String toggleFavorite = '/client/wishlists/';

  //////////////////////////Location/////////////////////////
  static const String suggestionsUrl = "/place/autocomplete/json";
  static const String placeLocationById = "/place/details/json";
  static const String getAddressNameByLocation = "/geocode/json";
  static const String updateUserLocation = "/user/profile/update-location";
  static const String cities = "/cities";
  static const String distracts = "/districts";
}
