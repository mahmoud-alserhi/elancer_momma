import 'package:elancer_momma/api/controllers/category_api_controller.dart';
import 'package:elancer_momma/get/category_getx_controller.dart';
import 'package:elancer_momma/get/home_getx_controller.dart';
import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/categories/category.dart';
import 'package:elancer_momma/screens/sub_categorise_screen.dart';
import 'package:elancer_momma/widgets/card_categorise.dart';
import 'package:elancer_momma/widgets/list_tile/menu_list_tile.dart';
import 'package:elancer_momma/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with Helpers{

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late Future<List<Category>> _future;
  List<Category> _categories = <Category>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = CategoryApiController().showCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: const Icon(
            Icons.menu_rounded,
            color: Color(0xff23203f),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.categorise,
          // 'Categorise',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 25.sp,
            color: const Color(0xff23203F),
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorite_screen');
            },
            icon: const Icon(
              Icons.favorite,
              color: Color(0xffFF0000),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(height: 50.h,),
            MenuListTile(title: AppLocalizations.of(context)!.home,icon: Icons.home_rounded,page: '/home_screen',),
            MenuListTile(title: AppLocalizations.of(context)!.updateProfile,icon: Icons.person_rounded,page: '/update_profile_screen',),
            MenuListTile(title: AppLocalizations.of(context)!.changePassword,icon: Icons.change_circle_rounded,page: '/change_password_screen',),
            MenuListTile(title: AppLocalizations.of(context)!.about,icon: Icons.info_rounded,page: '/about_screen',),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800), () {
                  launch('https://smart-store.mr-dev.tech/privacy-policy');
                });
              },
              leading: const Icon(
                Icons.local_police_rounded,
                color: Color(0xff23203F),
                size: 25,
              ),
              title: Text(
                AppLocalizations.of(context)!.privacyPolicies,
                // 'Privacy Policies',
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
            ),
            MenuListTile(title: AppLocalizations.of(context)!.setting,icon: Icons.settings_rounded,page: '/settings_screen',),
            MenuListTile(title: AppLocalizations.of(context)!.faqs,icon: Icons.announcement_rounded,page: '/faqs_screen',),
            MenuListTile(title: AppLocalizations.of(context)!.contactUs,icon: Icons.contact_support_rounded,page: '/contact_screen',),
            Divider(
              color: const Color(0xffD0D0D0),
              thickness: 2,
              endIndent: 23.w,
            ),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                await logOut(context);
              },
              leading: const Icon(
                Icons.logout_rounded,
                color: Color(0xff23203F),
                size: 25,
              ),
              title: Text(
                AppLocalizations.of(context)!.logout,
                // 'Logout',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 19.sp,
                  color: const Color(0xff23203F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 180.h,),
            // Spacer(),
            ListTile(
              title: Text(
                'MOMMA: 1.0.0',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 14.sp,
                  color: const Color(0xffD0D0D0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Category>>(
        future: _future,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
            _categories = snapshot.data ?? [];
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              itemCount: _categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.w,
                  crossAxisSpacing: 20.h,
                  childAspectRatio: 171.w / 210.h),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SubCategoriseScreen(id: _categories[index].id),
                      ),
                    );
                    // Navigator.pushNamed(context, '/sub_categorise_screen');
                  },
                  child: CardCategorise(
                    image: _categories[index].imageUrl,
                    title: _categories[index].categoryName,
                    subCategory: _categories[index].subCategoriesCount,
                    productCount: _categories[index].productsCount,
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
