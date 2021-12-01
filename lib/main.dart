import 'package:elancer_momma/screens/password/forgot_password_screen.dart';
import 'package:elancer_momma/screens/launch_screen.dart';
import 'package:elancer_momma/screens/login_screen.dart';
import 'package:elancer_momma/screens/out_boarding_screen.dart';
import 'package:elancer_momma/screens/register_screen.dart';
import 'package:elancer_momma/screens/password/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
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
          '/reset_password_screen' : (context) => const ResetPasswordScreen(),
        },
      ),
    );
  }
}

