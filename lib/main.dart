import 'package:elancer_momma/prefs/shared_pref_controller.dart';
import 'package:elancer_momma/screens/menu_screen/about_screen.dart';
import 'package:elancer_momma/screens/auth/activate_screen.dart';
import 'package:elancer_momma/screens/auth/password/change_password_screen.dart';
import 'package:elancer_momma/screens/auth/password/forgot_password_screen.dart';
import 'package:elancer_momma/screens/auth/password/reset_password_screen.dart';
import 'package:elancer_momma/screens/auth/update_profile_screen.dart';
import 'package:elancer_momma/screens/category_screen.dart';
import 'package:elancer_momma/screens/menu_screen/contact_screen.dart';
import 'package:elancer_momma/screens/detail_product_screen.dart';
import 'package:elancer_momma/screens/menu_screen/faqs_screen.dart';
import 'package:elancer_momma/screens/favorite_screen.dart';
import 'package:elancer_momma/screens/home_screen.dart';
import 'package:elancer_momma/screens/latest_products_screen.dart';
import 'package:elancer_momma/screens/launch_screen.dart';
import 'package:elancer_momma/screens/auth/login_screen.dart';
import 'package:elancer_momma/screens/menu_screen/setting_screen.dart';
import 'package:elancer_momma/screens/out_boarding_screen.dart';
import 'package:elancer_momma/screens/auth/register_screen.dart';
import 'package:elancer_momma/screens/products_screen.dart';
import 'package:elancer_momma/screens/sub_categorise_screen.dart';
import 'package:elancer_momma/widgets/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'get/language_getx_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(
    //this is class for Restart App when change lang
      RestartWidget(
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final LanguageGetxController _languageGetxController =Get.put<LanguageGetxController>(LanguageGetxController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates:  [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        // locale: Locale('ar'),
        locale: Locale(_languageGetxController.language),
        initialRoute: '/launch_screen',
        routes: {
          //---------------------------START SCREEN-----------------------------
          '/launch_screen' : (context) => const LaunchScreen(),
          '/out_boarding_screen' : (context) => const OutBoardingScreen(),
          //---------------------------AUTH SCREEN------------------------------
          '/login_screen' : (context) => const LoginScreen(),
          '/register_screen' : (context) => const RegisterScreen(),
          '/forget_password_screen' : (context) => const ForgotPassword(),
          // '/reset_password_screen' : (context) => const ResetPasswordScreen(),
          '/change_password_screen' : (context) => const ChangePasswordScreen(),
          '/update_profile_screen' : (context) => const UpdateProfileScreen(),
          // '/activate_screen' : (context) => const ActivateScreen(),
          //---------------------------HOME SCREEN------------------------------
          '/home_screen' : (context) => const HomeScreen(),
          //---------------------------CATEGORY SCREEN--------------------------
          '/categorise_screen' : (context) => const CategoryScreen(),
          // '/sub_categorise_screen' : (context) => const SubCategoriseScreen(),
          //---------------------------LATEST SCREEN----------------------------
          '/latest_products_screen' : (context) => const LatestProductsScreen(),
          //---------------------------PRODUCT SCREEN---------------------------
          // '/products_screen' : (context) => const ProductsScreen(),
          // '/details_product_screen' : (context) => const DetailProductScreen(),
          //---------------------------FAVORITE SCREEN--------------------------
          '/favorite_screen' : (context) => const FavoriteScreen(),
          //---------------------------MENU SCREEN-----------------------------
          '/faqs_screen' : (context) => const FAQseScreen(),
          '/contact_screen' : (context) => const ContactScreen(),
          '/about_screen' : (context) => const AboutScreen(),
          '/settings_screen' : (context) => const SettingScreen(),
        },
      ),
    );
  }
}

