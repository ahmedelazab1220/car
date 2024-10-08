import 'package:car_help/features/Notification/Presentation/views/notification_view.dart';
import 'package:car_help/features/addresses/presentation/views/addresses_view.dart';
import 'package:car_help/features/auth/domain/entities/user_entities.dart';
import 'package:car_help/features/auth/presentation/views/change_password_view.dart';
import 'package:car_help/features/auth/presentation/views/forget_password_view.dart';
import 'package:car_help/features/auth/presentation/views/login_view.dart';
import 'package:car_help/features/auth/presentation/views/otp_verification_view.dart';
import 'package:car_help/features/auth/presentation/views/register_view.dart';
import 'package:car_help/features/exhibits/domain/entities/exhiibits_entity.dart';
import 'package:car_help/features/exhibits/presentation/views/add_exhibit_view.dart';
import 'package:car_help/features/favorites/presentation/views/favorites_view.dart';
import 'package:car_help/features/home_client/domain/entities/provider_entity.dart';
import 'package:car_help/features/home_client/domain/entities/service_entity.dart';
import 'package:car_help/features/home_client/presentation/views/booking_view.dart';
import 'package:car_help/features/home_client/presentation/views/category_details_view.dart';
import 'package:car_help/features/home_client/presentation/views/provider_details_view.dart';
import 'package:car_help/features/home_provider/presentation/views/customer_orders_details_view.dart';
import 'package:car_help/features/layout/presentation/view/both_layout.dart';
import 'package:car_help/features/layout/presentation/view/client_layout.dart';
import 'package:car_help/features/layout/presentation/view/provider_layout.dart';
import 'package:car_help/features/location/presentation/pages/pick_location_screen.dart';
import 'package:car_help/features/my_services/presentation/views/my_service_details_view.dart';
import 'package:car_help/features/orders/domain/entities/order_entity.dart';
import 'package:car_help/features/orders/presentation/views/make_public_order_view.dart';
import 'package:car_help/features/orders/presentation/views/order_details_view.dart';
import 'package:car_help/features/profile/Presentation/views/edit_profile_view.dart';
import 'package:car_help/features/settings/presentation/views/about_us_view.dart';
import 'package:car_help/features/settings/presentation/views/contact_us_view.dart';
import 'package:car_help/features/settings/presentation/views/faq_view.dart';
import 'package:car_help/features/settings/presentation/views/privacy_policy_view.dart';
import 'package:car_help/features/settings/presentation/views/settings_view.dart';
import 'package:car_help/features/settings/presentation/views/technical_support_view.dart';
import 'package:car_help/features/settings/presentation/views/terms_&_conditions_view.dart';
import 'package:car_help/features/start/presentation/views/on_boarding_view.dart';
import 'package:car_help/features/start/presentation/views/splash_view.dart';
import 'package:car_help/features/start/presentation/views/start_view.dart';
import 'package:car_help/features/working%20days/presentation/views/working_days_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/OnBoardingView';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kOtpVerificationView = '/OtpVerificationView';
  static const kVerifyOtpEditPhoneView = '/VerifyOtpEditPhoneView';
  static const kForgetPasswordView = '/ForgetPasswordView';
  static const kUpdateRegisterDataView = '/UpdateRegisterDataView';
  static const kResetPasswordView = '/ResetPasswordView';
  static const kProviderLayout = '/ProviderLayout';
  static const kClientLayout = '/ClientLayout';
  static const kBothLayout = '/BothLayout';
  static const kNotificationView = '/NotificationView';
  static const kMessagesView = '/MessagesView';
  static const kSingleChatView = '/SingleChatView';
  static const kSingleProviderView = '/SingleProviderView';
  static const kEditProfileView = '/EditProfileView';
  static const kPrivacyPolicy = '/PrivacyPolicy';
  static const kTermsAndConditions = '/TermsAndConditions';
  static const kAboutUs = '/AboutUs';
  static const kFAQView = '/FAQView';
  static const kSearchView = '/SearchView';
  static const kTechnicalSupportView = '/TechnicalSupportView';
  static const kContactUsView = '/ContactUsView';
  static const kProviderDetailsView = '/ProviderDetailsView';
  static const kServiceProvidersView = '/ServiceProvidersView';
  static const kStartView = '/StartView';
  static const kPickLocationScreen = '/PickLocationScreen';
  static const kCustomerOrdersDetailsView = '/CustomerOrdersDetailsView';
  static const kSettingsView = '/SettingsView';
  static const kFavoritesView = '/FavoritesView';
  static const kCategoryDetailsView = '/CategoryDetailsView';
  static const kChangePasswordView = '/ChangePasswordView';
  static const kAddressesView = '/AddressesView';
  static const kAddExhibitView = '/AddExhibitView';
  static const kBookingView = '/BookingView';
  static const kOrderDetailsView = '/OrderDetailsView';
  static const kWorkingDaysView = '/WorkingDaysView';
  static const kMakePublicOrder = '/MakePublicOrder';
  static const kMyServiceDetailsView = '/MyServiceDetailsView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kOnBoardingView,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: kStartView,
      builder: (context, state) => const StartView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kRegisterView,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      path: kForgetPasswordView,
      builder: (context, state) => const ForgetPasswordView(),
    ),
    GoRoute(
      path: kOtpVerificationView,
      builder: (context, state) => OtpVerificationView(
        list: state.extra as List,
      ),
    ),
    GoRoute(
      path: kPickLocationScreen,
      builder: (context, state) => const PickLocationScreen(),
    ),
    GoRoute(
      path: kProviderDetailsView,
      builder: (context, state) =>
          ProviderDetailsView(data: state.extra as ProviderEntity),
    ),
    GoRoute(
      path: kFavoritesView,
      builder: (context, state) => const FavoritsView(),
    ),
    GoRoute(
      path: kCategoryDetailsView,
      builder: (context, state) => CategoryDetailsView(
        data: state.extra as ServiceEntity,
      ),
    ),
    GoRoute(
      path: kChangePasswordView,
      builder: (context, state) => const ChangePasswordView(),
    ),
    GoRoute(
      path: kAddressesView,
      builder: (context, state) => const AddressesView(),
    ),
    GoRoute(
      path: kNotificationView,
      builder: (context, state) => NotificationView(
        userType: state.extra as String?,
      ),
    ),
    GoRoute(
      path: kBothLayout,
      builder: (context, state) => const BothLayout(),
    ),
    GoRoute(
      path: kProviderLayout,
      builder: (context, state) => const ProviderLayout(),
    ),
    GoRoute(
      path: kClientLayout,
      builder: (context, state) => const ClientLayout(),
    ),
    GoRoute(
      path: kAddExhibitView,
      builder: (context, state) => AddExhibitView(
        data: state.extra as ExhibitsEntity?,
      ),
    ),
    GoRoute(
      path: kBookingView,
      builder: (context, state) => BookingView(
        list: state.extra as List,
      ),
    ),
    GoRoute(
      path: kEditProfileView,
      builder: (context, state) => EditProfileView(
        data: state.extra as UserEntity,
      ),
    ),
    GoRoute(
      path: kPrivacyPolicy,
      builder: (context, state) => const PrivacyPolicyView(),
    ),
    GoRoute(
      path: kTermsAndConditions,
      builder: (context, state) => const TermsAndConditionsView(),
    ),
    GoRoute(
      path: kAboutUs,
      builder: (context, state) => const AboutUsView(),
    ),
    GoRoute(
      path: kFAQView,
      builder: (context, state) => const FAQView(),
    ),
    GoRoute(
      path: kOrderDetailsView,
      builder: (context, state) => OrderDetailsView(
        list: state.extra as List,
      ),
    ),
    GoRoute(
      path: kContactUsView,
      builder: (context, state) => const ContactUsView(),
    ),
    GoRoute(
      path: kTechnicalSupportView,
      builder: (context, state) => const TechnicalSupportView(),
    ),
    GoRoute(
      path: kSettingsView,
      builder: (context, state) => SettingsView(
        userType: state.extra as String,
      ),
    ),
    GoRoute(
      path: kCustomerOrdersDetailsView,
      builder: (context, state) => CustomerOrdersDetailsView(
        data: state.extra as OrderEntity,
      ),
    ),
    GoRoute(
      path: kWorkingDaysView,
      builder: (context, state) => const WorkingDaysView(),
    ),
    GoRoute(
      path: kMakePublicOrder,
      builder: (context, state) => const MakePublicOrder(),
    ),
    GoRoute(
        path: kMyServiceDetailsView,
        builder: (context, state) => MyServiceDetailsView(
              list: state.extra as List,
            ))
  ]);
}
