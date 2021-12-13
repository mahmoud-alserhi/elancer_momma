import 'package:elancer_momma/prefs/shared_pref_controller.dart';
import 'package:elancer_momma/screens/auth/activate_screen.dart';
import 'package:elancer_momma/screens/auth/password/change_password_screen.dart';
import 'package:elancer_momma/screens/auth/password/forgot_password_screen.dart';
import 'package:elancer_momma/screens/auth/password/reset_password_screen.dart';
import 'package:elancer_momma/screens/auth/update_profile_screen.dart';
import 'package:elancer_momma/screens/category_screen.dart';
import 'package:elancer_momma/screens/contact.dart';
import 'package:elancer_momma/screens/detail_product_screen.dart';
import 'package:elancer_momma/screens/faqs_screen.dart';
import 'package:elancer_momma/screens/favorite_screen.dart';
import 'package:elancer_momma/screens/home_screen.dart';
import 'package:elancer_momma/screens/latest_products_screen.dart';
import 'package:elancer_momma/screens/launch_screen.dart';
import 'package:elancer_momma/screens/auth/login_screen.dart';
import 'package:elancer_momma/screens/out_boarding_screen.dart';
import 'package:elancer_momma/screens/auth/register_screen.dart';
import 'package:elancer_momma/screens/products_screen.dart';
import 'package:elancer_momma/screens/sub_categorise_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375,812),
      builder: () => MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        // locale: Locale('ar'),
        initialRoute: '/launch_screen',
        routes: {
          '/launch_screen' : (context) => const LaunchScreen(),
          '/out_boarding_screen' : (context) => const OutBoardingScreen(),
          '/login_screen' : (context) => const LoginScreen(),
          '/register_screen' : (context) => const RegisterScreen(),
          '/forget_password_screen' : (context) => const ForgotPassword(),
          // '/reset_password_screen' : (context) => const ResetPasswordScreen(),
          '/change_password_screen' : (context) => const ChangePasswordScreen(),
          '/update_profile_screen' : (context) => const UpdateProfileScreen(),
          // '/activate_screen' : (context) => const ActivateScreen(),
          '/home_screen' : (context) => const HomeScreen(),
          '/categorise_screen' : (context) => const CategoryScreen(),
          // '/sub_categorise_screen' : (context) => const SubCategoriseScreen(),
          '/latest_products_screen' : (context) => const LatestProductsScreen(),
          // '/products_screen' : (context) => const ProductsScreen(),
          // '/details_product_screen' : (context) => const DetailProductScreen(),
          '/favorite_screen' : (context) => const FavoriteScreen(),
          '/faqs_screen' : (context) => const FAQseScreen(),
          '/contact_screen' : (context) => const ContactScreen(),
        },
      ),
    );
  }
}

