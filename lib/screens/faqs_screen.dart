import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FAQseScreen extends StatefulWidget {
  const FAQseScreen({Key? key}) : super(key: key);

  @override
  _FAQseScreenState createState() => _FAQseScreenState();
}

class _FAQseScreenState extends State<FAQseScreen> with Helpers {

  List<Widget> _getChildren(int count, String name) => List<Widget>.generate(
        count,
        (i) => ListTile(title: Text(
          name,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 20.sp,
            color: const Color(0xff716F87),
            fontWeight: FontWeight.w600,
          ),
        )),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff23203f),
          ),
        ),
        title: Text(
          // AppLocalizations.of(context)!.home,
          'FAQs',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 25.sp,
            color: const Color(0xff23203F),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.language,
              color: Color(0xff23203f),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
        shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              'Question',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20.sp,
                color: const Color(0xff23203F),
                fontWeight: FontWeight.w600,
              ),
            ),
            children: _getChildren(1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
          );
        },
      ),
    );
  }
}
