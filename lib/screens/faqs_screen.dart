import 'package:elancer_momma/api/controllers/faqs_api_controller.dart';
import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/faqs/faqs.dart';
import 'package:elancer_momma/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  late Future<List<Faqs>> _future;
  List<Faqs> _faqs = <Faqs>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = FaqsApiController().showFAQs();
  }

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
          AppLocalizations.of(context)!.faqs,
          // 'FAQs',
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
            onPressed: () {
              setState(() {
                LanguageGetxController.to.changeLanguage();
              });
            },
            icon: const Icon(
              Icons.language,
              color: Color(0xff23203f),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Faqs>>(
        future: _future,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
            _faqs = snapshot.data ?? [];
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
              shrinkWrap: true,
              itemCount: _faqs.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(
                    _faqs[index].question,
                    // 'Question',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 20.sp,
                      color: const Color(0xff23203F),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  children: _getChildren(
                      1,
                      _faqs[index].answer
                  ),
                );
              },
            );
          }else{
            return widgetNoData(context);
          }
        },
      ),
    );
  }
}
