import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: shared pref
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      // String route = SharedPrefController().loggedIn ? '/main_screen' : '/out_boarding_screen';
      Navigator.pushReplacementNamed(context, '/out_boarding_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 375.w,
        height: 812.h,
        child: Image.asset('assets/images/launch.png',fit: BoxFit.cover,),
      ),
    );
  }
}
