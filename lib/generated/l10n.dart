// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Guest`
  String get guest {
    return Intl.message(
      'Guest',
      name: 'guest',
      desc: '',
      args: [],
    );
  }

  /// `Client`
  String get client {
    return Intl.message(
      'Client',
      name: 'client',
      desc: '',
      args: [],
    );
  }

  /// `Provider`
  String get provider {
    return Intl.message(
      'Provider',
      name: 'provider',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get language {
    return Intl.message(
      'English',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to CarHelp, where expert repairs give you peace of mind`
  String get onBoarding1 {
    return Intl.message(
      'Welcome to CarHelp, where expert repairs give you peace of mind',
      name: 'onBoarding1',
      desc: '',
      args: [],
    );
  }

  /// `Maximize your car's potential with CarHelp, your perfect repair companion!`
  String get onBoarding2 {
    return Intl.message(
      'Maximize your car\'s potential with CarHelp, your perfect repair companion!',
      name: 'onBoarding2',
      desc: '',
      args: [],
    );
  }

  /// `Join the smooth car maintenance journey with CarHelp leading the way.`
  String get onBoarding3 {
    return Intl.message(
      'Join the smooth car maintenance journey with CarHelp leading the way.',
      name: 'onBoarding3',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start`
  String get letsStart {
    return Intl.message(
      'Let`s Start',
      name: 'letsStart',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get chooseLang {
    return Intl.message(
      'Choose Language',
      name: 'chooseLang',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get choose {
    return Intl.message(
      'Choose',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get loginToYourAccount {
    return Intl.message(
      'Login to your account',
      name: 'loginToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enterYourPhoneNumber {
    return Intl.message(
      'Enter your phone number',
      name: 'enterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get phoneNumberValidation {
    return Intl.message(
      'Phone number is required',
      name: 'phoneNumberValidation',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `password is required`
  String get passwordValidation {
    return Intl.message(
      'password is required',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Forget your Password ?`
  String get forgetPassword {
    return Intl.message(
      'Forget your Password ?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget your Password`
  String get forgetPassword1 {
    return Intl.message(
      'Forget your Password',
      name: 'forgetPassword1',
      desc: '',
      args: [],
    );
  }

  /// `Not a subscriber with us?`
  String get notSubscribedWithUs {
    return Intl.message(
      'Not a subscriber with us?',
      name: 'notSubscribedWithUs',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Welcome, all you have to do is create an account with us`
  String get createAccountBody {
    return Intl.message(
      'Welcome, all you have to do is create an account with us',
      name: 'createAccountBody',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your mobile number, then a message will be sent to you with a confirmation code`
  String get forgetPasswordBody1 {
    return Intl.message(
      'Please enter your mobile number, then a message will be sent to you with a confirmation code',
      name: 'forgetPasswordBody1',
      desc: '',
      args: [],
    );
  }

  /// `Phone verification`
  String get phoneVerification {
    return Intl.message(
      'Phone verification',
      name: 'phoneVerification',
      desc: '',
      args: [],
    );
  }

  /// `Please write the code sent to the number`
  String get phoneVerificationBody {
    return Intl.message(
      'Please write the code sent to the number',
      name: 'phoneVerificationBody',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Reject`
  String get reject {
    return Intl.message(
      'Reject',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Did you not receive a code?`
  String get notReceiveCoding {
    return Intl.message(
      'Did you not receive a code?',
      name: 'notReceiveCoding',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Set a password`
  String get setAPassword {
    return Intl.message(
      'Set a password',
      name: 'setAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Choose a new password that suits you`
  String get setAPasswordBody {
    return Intl.message(
      'Choose a new password that suits you',
      name: 'setAPasswordBody',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// ` Home`
  String get home {
    return Intl.message(
      ' Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// ` Orders`
  String get orders {
    return Intl.message(
      ' Orders',
      name: 'orders',
      desc: '',
      args: [],
    );
  }

  /// ` Cars`
  String get cars {
    return Intl.message(
      ' Cars',
      name: 'cars',
      desc: '',
      args: [],
    );
  }

  /// ` More`
  String get more {
    return Intl.message(
      ' More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `My Services`
  String get myServices {
    return Intl.message(
      'My Services',
      name: 'myServices',
      desc: '',
      args: [],
    );
  }

  /// ` Services`
  String get services {
    return Intl.message(
      ' Services',
      name: 'services',
      desc: '',
      args: [],
    );
  }

  /// ` General`
  String get general {
    return Intl.message(
      ' General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Choose your preferred language`
  String get chooseLanguage {
    return Intl.message(
      'Choose your preferred language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPassword {
    return Intl.message(
      'New password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `new password is required`
  String get newPasswordValidation {
    return Intl.message(
      'new password is required',
      name: 'newPasswordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Enter a new password of your choice`
  String get newPasswordLabel {
    return Intl.message(
      'Enter a new password of your choice',
      name: 'newPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the new password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm the new password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm the new password is required`
  String get confirmNewPasswordValidation {
    return Intl.message(
      'Confirm the new password is required',
      name: 'confirmNewPasswordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Re enter the password`
  String get confirmNewPasswordLabel {
    return Intl.message(
      'Re enter the password',
      name: 'confirmNewPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have account ? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have account ? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get fullNameHint {
    return Intl.message(
      'Enter your full name',
      name: 'fullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Full name is required`
  String get fullNameValidation {
    return Intl.message(
      'Full name is required',
      name: 'fullNameValidation',
      desc: '',
      args: [],
    );
  }

  /// `By clicking here, I agree to the`
  String get registerCheckBox1 {
    return Intl.message(
      'By clicking here, I agree to the',
      name: 'registerCheckBox1',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Center Name`
  String get centerName {
    return Intl.message(
      'Center Name',
      name: 'centerName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your center name`
  String get enterCenterName {
    return Intl.message(
      'Enter your center name',
      name: 'enterCenterName',
      desc: '',
      args: [],
    );
  }

  /// `Commercial Register`
  String get commercialRegister {
    return Intl.message(
      'Commercial Register',
      name: 'commercialRegister',
      desc: '',
      args: [],
    );
  }

  /// `Enter your namber of commercial register`
  String get enterCommercialRegister {
    return Intl.message(
      'Enter your namber of commercial register',
      name: 'enterCommercialRegister',
      desc: '',
      args: [],
    );
  }

  /// `Center Classification`
  String get centerClassification {
    return Intl.message(
      'Center Classification',
      name: 'centerClassification',
      desc: '',
      args: [],
    );
  }

  /// `Choose the type of services your place offers`
  String get chooseCenterClassification {
    return Intl.message(
      'Choose the type of services your place offers',
      name: 'chooseCenterClassification',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get feildRequiredValidation {
    return Intl.message(
      'This field is required',
      name: 'feildRequiredValidation',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Maintenance`
  String get mobileMaintenance {
    return Intl.message(
      'Mobile Maintenance',
      name: 'mobileMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `General Maintenance`
  String get generalMaintenance {
    return Intl.message(
      'General Maintenance',
      name: 'generalMaintenance',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Washing`
  String get mobileWashing {
    return Intl.message(
      'Mobile Washing',
      name: 'mobileWashing',
      desc: '',
      args: [],
    );
  }

  /// `Protection And Shading`
  String get protectionAndShading {
    return Intl.message(
      'Protection And Shading',
      name: 'protectionAndShading',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Tires`
  String get mobileTires {
    return Intl.message(
      'Mobile Tires',
      name: 'mobileTires',
      desc: '',
      args: [],
    );
  }

  /// `Adjustment And Repair`
  String get adjustmentAndRepair {
    return Intl.message(
      'Adjustment And Repair',
      name: 'adjustmentAndRepair',
      desc: '',
      args: [],
    );
  }

  /// `You can choose more than one type of service`
  String get chooseService {
    return Intl.message(
      'You can choose more than one type of service',
      name: 'chooseService',
      desc: '',
      args: [],
    );
  }

  /// `Service Providers Near You`
  String get serviceProvidersNearYou {
    return Intl.message(
      'Service Providers Near You',
      name: 'serviceProvidersNearYou',
      desc: '',
      args: [],
    );
  }

  /// `There are no service providers in your area.`
  String get noServiceProviders {
    return Intl.message(
      'There are no service providers in your area.',
      name: 'noServiceProviders',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Work hours`
  String get workHours {
    return Intl.message(
      'Work hours',
      name: 'workHours',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get saturday {
    return Intl.message(
      'Saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get sunday {
    return Intl.message(
      'Sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get monday {
    return Intl.message(
      'Monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get tuesday {
    return Intl.message(
      'Tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get wednesday {
    return Intl.message(
      'Wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get thursday {
    return Intl.message(
      'Thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get friday {
    return Intl.message(
      'Friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `Your statistics`
  String get yourStatistics {
    return Intl.message(
      'Your statistics',
      name: 'yourStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Exhibits`
  String get exhibits {
    return Intl.message(
      'Exhibits',
      name: 'exhibits',
      desc: '',
      args: [],
    );
  }

  /// `Exhibit Requests`
  String get exhibitRequests {
    return Intl.message(
      'Exhibit Requests',
      name: 'exhibitRequests',
      desc: '',
      args: [],
    );
  }

  /// `Special Requests`
  String get specialRequests {
    return Intl.message(
      'Special Requests',
      name: 'specialRequests',
      desc: '',
      args: [],
    );
  }

  /// `General Requests`
  String get generalRequests {
    return Intl.message(
      'General Requests',
      name: 'generalRequests',
      desc: '',
      args: [],
    );
  }

  /// `S.R`
  String get currency {
    return Intl.message(
      'S.R',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Make a Request`
  String get makeARequest {
    return Intl.message(
      'Make a Request',
      name: 'makeARequest',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added your cars yet, add them now!`
  String get noCars {
    return Intl.message(
      'You haven\'t added your cars yet, add them now!',
      name: 'noCars',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added your addresses yet, add them now!`
  String get noAddresses {
    return Intl.message(
      'You haven\'t added your addresses yet, add them now!',
      name: 'noAddresses',
      desc: '',
      args: [],
    );
  }

  /// `You have not made any request yet!`
  String get noRequestes {
    return Intl.message(
      'You have not made any request yet!',
      name: 'noRequestes',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get isDefault {
    return Intl.message(
      'Default',
      name: 'isDefault',
      desc: '',
      args: [],
    );
  }

  /// `Car`
  String get car {
    return Intl.message(
      'Car',
      name: 'car',
      desc: '',
      args: [],
    );
  }

  /// `Add a Car`
  String get addACar {
    return Intl.message(
      'Add a Car',
      name: 'addACar',
      desc: '',
      args: [],
    );
  }

  /// `Add Address`
  String get addAddress {
    return Intl.message(
      'Add Address',
      name: 'addAddress',
      desc: '',
      args: [],
    );
  }

  /// `Car Brand *`
  String get carBrand {
    return Intl.message(
      'Car Brand *',
      name: 'carBrand',
      desc: '',
      args: [],
    );
  }

  /// `Choose Car Brand *`
  String get chooseBrandCar {
    return Intl.message(
      'Choose Car Brand *',
      name: 'chooseBrandCar',
      desc: '',
      args: [],
    );
  }

  /// `Car Model *`
  String get carModel {
    return Intl.message(
      'Car Model *',
      name: 'carModel',
      desc: '',
      args: [],
    );
  }

  /// `Choose Car Model *`
  String get chooseModelCar {
    return Intl.message(
      'Choose Car Model *',
      name: 'chooseModelCar',
      desc: '',
      args: [],
    );
  }

  /// `Car Type *`
  String get carType {
    return Intl.message(
      'Car Type *',
      name: 'carType',
      desc: '',
      args: [],
    );
  }

  /// `Enter Car Type *`
  String get enterTypeCar {
    return Intl.message(
      'Enter Car Type *',
      name: 'enterTypeCar',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get newRequests {
    return Intl.message(
      'New',
      name: 'newRequests',
      desc: '',
      args: [],
    );
  }

  /// `New Orders`
  String get newOrders {
    return Intl.message(
      'New Orders',
      name: 'newOrders',
      desc: '',
      args: [],
    );
  }

  /// `Completed Orders`
  String get completedOrders {
    return Intl.message(
      'Completed Orders',
      name: 'completedOrders',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled Orders`
  String get cancelledOrders {
    return Intl.message(
      'Cancelled Orders',
      name: 'cancelledOrders',
      desc: '',
      args: [],
    );
  }

  /// `Customer Orders`
  String get customerOrders {
    return Intl.message(
      'Customer Orders',
      name: 'customerOrders',
      desc: '',
      args: [],
    );
  }

  /// `On going`
  String get onGoing {
    return Intl.message(
      'On going',
      name: 'onGoing',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Order number`
  String get orderNumber {
    return Intl.message(
      'Order number',
      name: 'orderNumber',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `address for you`
  String get addressForYou {
    return Intl.message(
      'address for you',
      name: 'addressForYou',
      desc: '',
      args: [],
    );
  }

  /// `My Addresses`
  String get myAddresses {
    return Intl.message(
      'My Addresses',
      name: 'myAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Create your addresses`
  String get createYourAddresses {
    return Intl.message(
      'Create your addresses',
      name: 'createYourAddresses',
      desc: '',
      args: [],
    );
  }

  /// `Order date`
  String get orderDate {
    return Intl.message(
      'Order date',
      name: 'orderDate',
      desc: '',
      args: [],
    );
  }

  /// `Service cost`
  String get serviceCost {
    return Intl.message(
      'Service cost',
      name: 'serviceCost',
      desc: '',
      args: [],
    );
  }

  /// `Payment method`
  String get paymentMethod {
    return Intl.message(
      'Payment method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary`
  String get orderSummary {
    return Intl.message(
      'Order Summary',
      name: 'orderSummary',
      desc: '',
      args: [],
    );
  }

  /// `Cancelling Order`
  String get cancellingOrder {
    return Intl.message(
      'Cancelling Order',
      name: 'cancellingOrder',
      desc: '',
      args: [],
    );
  }

  /// `The Offered Service`
  String get theOfferedService {
    return Intl.message(
      'The Offered Service',
      name: 'theOfferedService',
      desc: '',
      args: [],
    );
  }

  /// `Service Required`
  String get serviceRequired {
    return Intl.message(
      'Service Required',
      name: 'serviceRequired',
      desc: '',
      args: [],
    );
  }

  /// `Exhibit Required`
  String get exhibitRequired {
    return Intl.message(
      'Exhibit Required',
      name: 'exhibitRequired',
      desc: '',
      args: [],
    );
  }

  /// `Exhibit value`
  String get exhibitValue {
    return Intl.message(
      'Exhibit value',
      name: 'exhibitValue',
      desc: '',
      args: [],
    );
  }

  /// `Service Type`
  String get serviceType {
    return Intl.message(
      'Service Type',
      name: 'serviceType',
      desc: '',
      args: [],
    );
  }

  /// `Service Details`
  String get serviceDetails {
    return Intl.message(
      'Service Details',
      name: 'serviceDetails',
      desc: '',
      args: [],
    );
  }

  /// `Attach photos`
  String get attachPhotos {
    return Intl.message(
      'Attach photos',
      name: 'attachPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Received`
  String get received {
    return Intl.message(
      'Received',
      name: 'received',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! Your order has been successfully received.`
  String get successfullyReceived {
    return Intl.message(
      'Congratulations! Your order has been successfully received.',
      name: 'successfullyReceived',
      desc: '',
      args: [],
    );
  }

  /// `Please rate to help us provide the best possible service.`
  String get rateToHelp {
    return Intl.message(
      'Please rate to help us provide the best possible service.',
      name: 'rateToHelp',
      desc: '',
      args: [],
    );
  }

  /// `Service Provider Information`
  String get serviceProviderInformation {
    return Intl.message(
      'Service Provider Information',
      name: 'serviceProviderInformation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel your order?`
  String get cacelYourOrder {
    return Intl.message(
      'Are you sure you want to cancel your order?',
      name: 'cacelYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this item?`
  String get deleteExhibitMsg {
    return Intl.message(
      'Are you sure you want to delete this item?',
      name: 'deleteExhibitMsg',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?`
  String get deleteAccountMsg {
    return Intl.message(
      'Are you sure you want to delete your account?',
      name: 'deleteAccountMsg',
      desc: '',
      args: [],
    );
  }

  /// `By deleting your account, you will not be able to access.`
  String get deleteAccountDesc {
    return Intl.message(
      'By deleting your account, you will not be able to access.',
      name: 'deleteAccountDesc',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Favorite`
  String get cancelFavorite {
    return Intl.message(
      'Cancel Favorite',
      name: 'cancelFavorite',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added any favorites yet.`
  String get noFavorites {
    return Intl.message(
      'You haven\'t added any favorites yet.',
      name: 'noFavorites',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel your favorite?`
  String get cancelFavoritesMsg {
    return Intl.message(
      'Are you sure you want to cancel your favorite?',
      name: 'cancelFavoritesMsg',
      desc: '',
      args: [],
    );
  }

  /// `By cancelling your favorite, it will be removed from the favorites list`
  String get cancelFavoritesDesc {
    return Intl.message(
      'By cancelling your favorite, it will be removed from the favorites list',
      name: 'cancelFavoritesDesc',
      desc: '',
      args: [],
    );
  }

  /// `You haven't added any items yet, add them now!`
  String get noExhibitsMsg {
    return Intl.message(
      'You haven\'t added any items yet, add them now!',
      name: 'noExhibitsMsg',
      desc: '',
      args: [],
    );
  }

  /// `Reason for Cancellation`
  String get reasonForCancellation {
    return Intl.message(
      'Reason for Cancellation',
      name: 'reasonForCancellation',
      desc: '',
      args: [],
    );
  }

  /// `Responsiveness`
  String get responsiveness {
    return Intl.message(
      'Responsiveness',
      name: 'responsiveness',
      desc: '',
      args: [],
    );
  }

  /// `Workmanship`
  String get workmanship {
    return Intl.message(
      'Workmanship',
      name: 'workmanship',
      desc: '',
      args: [],
    );
  }

  /// `Price for service`
  String get priceForService {
    return Intl.message(
      'Price for service',
      name: 'priceForService',
      desc: '',
      args: [],
    );
  }

  /// `Price Offers`
  String get priceOffers {
    return Intl.message(
      'Price Offers',
      name: 'priceOffers',
      desc: '',
      args: [],
    );
  }

  /// `Price Offer`
  String get priceOffer {
    return Intl.message(
      'Price Offer',
      name: 'priceOffer',
      desc: '',
      args: [],
    );
  }

  /// `Direct Price`
  String get directPrice {
    return Intl.message(
      'Direct Price',
      name: 'directPrice',
      desc: '',
      args: [],
    );
  }

  /// `Price Submission`
  String get priceSubmission {
    return Intl.message(
      'Price Submission',
      name: 'priceSubmission',
      desc: '',
      args: [],
    );
  }

  /// `Visit for inspection`
  String get visitForInspection {
    return Intl.message(
      'Visit for inspection',
      name: 'visitForInspection',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Price Quote`
  String get priceQuote {
    return Intl.message(
      'Price Quote',
      name: 'priceQuote',
      desc: '',
      args: [],
    );
  }

  /// `Enter the price`
  String get enterPrice {
    return Intl.message(
      'Enter the price',
      name: 'enterPrice',
      desc: '',
      args: [],
    );
  }

  /// `The price will be determined after the visit and inspection`
  String get determineThePrice {
    return Intl.message(
      'The price will be determined after the visit and inspection',
      name: 'determineThePrice',
      desc: '',
      args: [],
    );
  }

  /// `Add Exhibit`
  String get addExhibit {
    return Intl.message(
      'Add Exhibit',
      name: 'addExhibit',
      desc: '',
      args: [],
    );
  }

  /// `Exhibit Price`
  String get exhibitPrice {
    return Intl.message(
      'Exhibit Price',
      name: 'exhibitPrice',
      desc: '',
      args: [],
    );
  }

  /// `Exhibit Name`
  String get exhibitName {
    return Intl.message(
      'Exhibit Name',
      name: 'exhibitName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the name of the exhibit`
  String get enterExhibitName {
    return Intl.message(
      'Please enter the name of the exhibit',
      name: 'enterExhibitName',
      desc: '',
      args: [],
    );
  }

  /// `Exhibit Details`
  String get exhibitDetails {
    return Intl.message(
      'Exhibit Details',
      name: 'exhibitDetails',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the details of the exhibit`
  String get enterExhibitDetails {
    return Intl.message(
      'Please enter the details of the exhibit',
      name: 'enterExhibitDetails',
      desc: '',
      args: [],
    );
  }

  /// `Price After Discount`
  String get priceAfterDiscount {
    return Intl.message(
      'Price After Discount',
      name: 'priceAfterDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the quantity`
  String get enterQuantity {
    return Intl.message(
      'Please enter the quantity',
      name: 'enterQuantity',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Send the Offer`
  String get sendTheOffer {
    return Intl.message(
      'Send the Offer',
      name: 'sendTheOffer',
      desc: '',
      args: [],
    );
  }

  /// `Reject the Request`
  String get rejectTheRequest {
    return Intl.message(
      'Reject the Request',
      name: 'rejectTheRequest',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Please enter more information about your request`
  String get enterComments {
    return Intl.message(
      'Please enter more information about your request',
      name: 'enterComments',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message(
      'Contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Client Information`
  String get clientInformation {
    return Intl.message(
      'Client Information',
      name: 'clientInformation',
      desc: '',
      args: [],
    );
  }

  /// `Client Name`
  String get clientName {
    return Intl.message(
      'Client Name',
      name: 'clientName',
      desc: '',
      args: [],
    );
  }

  /// `Client Address`
  String get clientAddress {
    return Intl.message(
      'Client Address',
      name: 'clientAddress',
      desc: '',
      args: [],
    );
  }

  /// `For more information`
  String get moreInformation {
    return Intl.message(
      'For more information',
      name: 'moreInformation',
      desc: '',
      args: [],
    );
  }

  /// `The request has been successfully approved!`
  String get approveTheRequest {
    return Intl.message(
      'The request has been successfully approved!',
      name: 'approveTheRequest',
      desc: '',
      args: [],
    );
  }

  /// `Your offer has been sent successfully!`
  String get sentSuccessfully {
    return Intl.message(
      'Your offer has been sent successfully!',
      name: 'sentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `You will receive a notification when the customer accepts the quote`
  String get receiveANotification {
    return Intl.message(
      'You will receive a notification when the customer accepts the quote',
      name: 'receiveANotification',
      desc: '',
      args: [],
    );
  }

  /// `Go to checkout to complete the service`
  String get goToCheckout {
    return Intl.message(
      'Go to checkout to complete the service',
      name: 'goToCheckout',
      desc: '',
      args: [],
    );
  }

  /// `Go to complete the reservation`
  String get completeTheReservation {
    return Intl.message(
      'Go to complete the reservation',
      name: 'completeTheReservation',
      desc: '',
      args: [],
    );
  }

  /// `Back to the home page`
  String get backToHomePage {
    return Intl.message(
      'Back to the home page',
      name: 'backToHomePage',
      desc: '',
      args: [],
    );
  }

  /// `Your evaluation of the service provider`
  String get yourEvaluation {
    return Intl.message(
      'Your evaluation of the service provider',
      name: 'yourEvaluation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the reason for cancellation.`
  String get enterReasonForCancellation {
    return Intl.message(
      'Please enter the reason for cancellation.',
      name: 'enterReasonForCancellation',
      desc: '',
      args: [],
    );
  }

  /// `When you cancel your order, we cannot refund the amount paid or return your order again.`
  String get worningCancelledOrder {
    return Intl.message(
      'When you cancel your order, we cannot refund the amount paid or return your order again.',
      name: 'worningCancelledOrder',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get emailValidation {
    return Intl.message(
      'Please enter a valid email',
      name: 'emailValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get phoneValidation {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'phoneValidation',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get confirmPasswordValidation {
    return Intl.message(
      'Please enter a valid password',
      name: 'confirmPasswordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get confirmPasswordNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'confirmPasswordNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Additional address Details`
  String get additionalAddressDetails {
    return Intl.message(
      'Additional address Details',
      name: 'additionalAddressDetails',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Choose City`
  String get chooseCity {
    return Intl.message(
      'Choose City',
      name: 'chooseCity',
      desc: '',
      args: [],
    );
  }

  /// `District`
  String get district {
    return Intl.message(
      'District',
      name: 'district',
      desc: '',
      args: [],
    );
  }

  /// `Choose District`
  String get chooseDistrict {
    return Intl.message(
      'Choose District',
      name: 'chooseDistrict',
      desc: '',
      args: [],
    );
  }

  /// `Problem Type`
  String get problemType {
    return Intl.message(
      'Problem Type',
      name: 'problemType',
      desc: '',
      args: [],
    );
  }

  /// `Choose Problem Type`
  String get chooseProblemType {
    return Intl.message(
      'Choose Problem Type',
      name: 'chooseProblemType',
      desc: '',
      args: [],
    );
  }

  /// `You can choose more than one type of service.`
  String get multiSelectService {
    return Intl.message(
      'You can choose more than one type of service.',
      name: 'multiSelectService',
      desc: '',
      args: [],
    );
  }

  /// `About the app`
  String get aboutapp {
    return Intl.message(
      'About the app',
      name: 'aboutapp',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get cancelOrder {
    return Intl.message(
      'Cancel Order',
      name: 'cancelOrder',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Session Expired`
  String get sessionExpired {
    return Intl.message(
      'Session Expired',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Your session has expired. Please login again.`
  String get sessionExpiredMsg {
    return Intl.message(
      'Your session has expired. Please login again.',
      name: 'sessionExpiredMsg',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `About CarHelp`
  String get aboutCarHelp {
    return Intl.message(
      'About CarHelp',
      name: 'aboutCarHelp',
      desc: '',
      args: [],
    );
  }

  /// `Your Message`
  String get yourMessage {
    return Intl.message(
      'Your Message',
      name: 'yourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your message`
  String get yourMessageValidation {
    return Intl.message(
      'Please enter your message',
      name: 'yourMessageValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please write more details about the cause of the problem for easy resolution`
  String get yourMessageHint {
    return Intl.message(
      'Please write more details about the cause of the problem for easy resolution',
      name: 'yourMessageHint',
      desc: '',
      args: [],
    );
  }

  /// `edit`
  String get edit {
    return Intl.message(
      'edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get oldPasswordValidation {
    return Intl.message(
      'Please enter a valid password',
      name: 'oldPasswordValidation',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Push Notifications`
  String get pushNotifications {
    return Intl.message(
      'Push Notifications',
      name: 'pushNotifications',
      desc: '',
      args: [],
    );
  }

  /// `For daily updates and more`
  String get pushNotificationsDescription {
    return Intl.message(
      'For daily updates and more',
      name: 'pushNotificationsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Advertise Notifications`
  String get advertiseNotifications {
    return Intl.message(
      'Advertise Notifications',
      name: 'advertiseNotifications',
      desc: '',
      args: [],
    );
  }

  /// `For discounts and advertising`
  String get advertiseNotificationsDescription {
    return Intl.message(
      'For discounts and advertising',
      name: 'advertiseNotificationsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Notifications toggled successfully`
  String get notificationsToggleSuccess {
    return Intl.message(
      'Notifications toggled successfully',
      name: 'notificationsToggleSuccess',
      desc: '',
      args: [],
    );
  }

  /// `My Favorites`
  String get myFavorites {
    return Intl.message(
      'My Favorites',
      name: 'myFavorites',
      desc: '',
      args: [],
    );
  }

  /// `List of preferred service providers`
  String get myFavoritesDescription {
    return Intl.message(
      'List of preferred service providers',
      name: 'myFavoritesDescription',
      desc: '',
      args: [],
    );
  }

  /// `There are`
  String get thereAre {
    return Intl.message(
      'There are',
      name: 'thereAre',
      desc: '',
      args: [],
    );
  }

  /// `Service Provider`
  String get serviceProvider {
    return Intl.message(
      'Service Provider',
      name: 'serviceProvider',
      desc: '',
      args: [],
    );
  }

  /// `Near You`
  String get nearYou {
    return Intl.message(
      'Near You',
      name: 'nearYou',
      desc: '',
      args: [],
    );
  }

  /// `Favorite For You`
  String get favoriteForYou {
    return Intl.message(
      'Favorite For You',
      name: 'favoriteForYou',
      desc: '',
      args: [],
    );
  }

  /// `Allow`
  String get allow {
    return Intl.message(
      'Allow',
      name: 'allow',
      desc: '',
      args: [],
    );
  }

  /// `Allow sharing of your location`
  String get sharingLocation {
    return Intl.message(
      'Allow sharing of your location',
      name: 'sharingLocation',
      desc: '',
      args: [],
    );
  }

  /// `Please share your location with us so we can show you the nearest services`
  String get sharingLocationDesc {
    return Intl.message(
      'Please share your location with us so we can show you the nearest services',
      name: 'sharingLocationDesc',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
