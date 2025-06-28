import 'package:associations_app/presentation/about_screen/about_screen.dart';
import 'package:associations_app/presentation/about_screen/bindings/about_us_bindings.dart';
import 'package:associations_app/presentation/bottom_nav_screen/binding/bottom_nav_binding.dart';
import 'package:associations_app/presentation/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:associations_app/presentation/news_inner_screen/bindings/news_inner_binding.dart';
import 'package:associations_app/presentation/news_inner_screen/news_inner_screen.dart';
import 'package:associations_app/presentation/otp_screen/binding/otp_binding.dart';
import 'package:associations_app/presentation/otp_screen/otp_screen.dart';
import 'package:associations_app/presentation/quick_contact_screen/binding/quick_contact_binding.dart';
import 'package:associations_app/presentation/quick_contact_screen/quick_contact_screen.dart';
import 'package:associations_app/presentation/refer_member_screen/bindings/refer_member_binding.dart';
import 'package:associations_app/presentation/refer_member_screen/refer_member_screen.dart';
import 'package:associations_app/presentation/sign_in_screen/binding/sign_in_binding.dart';
import 'package:associations_app/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:associations_app/presentation/splash_screen/binding/splash_binding.dart';
import 'package:associations_app/presentation/splash_screen/splash_screen.dart';
import 'package:associations_app/presentation/welcome_screen/bindings/welcome_binding.dart';
import 'package:associations_app/presentation/welcome_screen/welcome_screen.dart';
import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:get/get.dart';

class PageList {
  static var pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.signInScreen,
      page: () => SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () => WelcomeScreen(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.otpScreen,
      page: () => OtpScreen(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomNavScreen,
      page: () => BottomNavScreen(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: AppRoutes.newsInnerScreen,
      page: () => NewsInnerScreen(),
      binding: NewsInnerBinding(),
    ),
    GetPage(
      name: AppRoutes.aboutUs,
      page: () => AboutScreen(),
      binding: AboutUsBindings(),
    ),
    GetPage(
      name: AppRoutes.referScreen,
      page: () => ReferMemberScreen(),
      binding: ReferMemberBinding(),
    ),
    GetPage(
      name: AppRoutes.quickContactScreen,
      page: () => QuickContactScreen(),
      binding: QuickContactBinding(),
    ),
  ];
}
