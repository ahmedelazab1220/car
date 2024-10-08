class EndPoints {
  /////////////// Auth User  ////////////////
  static const String userLogin = "/auth/login";
  static const String registerUser = "/auth/register";
  static const String sendOtpUser = "/auth/send-otp";
  static const String verifyOtp = "/auth/verify-otp";
  static const String updateRegisterData = "/auth/update-user/";
  static const String changePassword = "/profile/update-password";

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
  static const String toggleLanguage = '/profile/update-language';

  /////////////// Notification  ////////////////
  static const String notification = '/notification';
  static const String markAllAsRead = '/mark-all-notifications-as-read';
  static const String toggleNotification = '/profile/update-notification';

  /////////////// Pages  ////////////////
  static const String getPrivacyPolicy = '/pages/3';
  static const String getTermsAndConditions = '/pages/2';
  static const String getAboutUs = '/pages/1';

  /////////////// public  ////////////////
  static const String getProblemTypes = '/problem-types';
  static const String getCarModels = '/car-models';
  static const String getCarFactories = '/car-factories';

  /////////////// Home ///////////////////
  static const String getClientHome = '/home';
  static const String getProviderHome = '/provider/home';
  static const String getProvider = '/providers/';
  static const String getProviders = '/providers?';
  static const String sendOffer = '/provider/offer';

  /////////////// Services  ////////////////
  static const String getServices = '/categories';
  static const String getBannerCategories = '/banner-categories';
  static const String getPrograms = '/programs';
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

  /////////////// Addresses  ////////////////
  static const String getAddresses = '/client/addresses';
  static const String addAddress = '/client/addresses';
  static const String updateAddress = '/client/addresses/';
  static const String deleteAddress = '/client/addresses/';

  /////////////// Cars  ////////////////
  static const String getMyCars = '/client/cars';
  static const String addMyCar = '/client/cars';
  static const String updateMyCar = '/client/cars/';
  static const String deleteMyCar = '/client/cars/';

  ///////////// My Services //////////////
  static const String addMyServices = '/provider/orders';
  static const String deleteMyServices = '/provider/orders';
  static const String getMyServices = '/provider/orders';
  static const String updateMyServices = '/provider/orders';

  /////////////// Exhibits /////////////////
  static const String getExhibits = '/provider/services';
  static const String updateExhibits = '/provider/services/';
  static const String deleteExhibits = '/provider/services/';
  static const String addExhibits = '/provider/services';

  //////////////// Orders //////////////////
  static const String getProviderTimes = '/client/provider-times';
  static const String getMyOrders = '/client/orders';
  static const String addMyOrder = '/client/orders';
  static const String cancelMyOrder = '/client/orders/';
}
