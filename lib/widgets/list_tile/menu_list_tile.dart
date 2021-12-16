import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuListTile extends StatelessWidget {
  MenuListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.page,
  }) : super(key: key);

  String title;
  IconData icon;
  String page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Future.delayed(const Duration(microseconds: 800), () {
          Navigator.pushNamed(context, page);
        });
      },
      leading: Icon(
        icon,
        color: const Color(0xff23203F),
        size: 25,
      ),
      title: Text(
        // AppLocalizations.of(context)!.home,
        // 'Home',
        title,
        style: TextStyle(
          fontFamily: 'Nunito',
          fontSize: 19.sp,
          color: const Color(0xff23203F),
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Color(0xff23203F),
      ),
    );
  }
}