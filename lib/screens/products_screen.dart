import 'package:elancer_momma/api/controllers/product_read_api_controller.dart';
import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/products/product.dart';
import 'package:elancer_momma/models/api/sub_category/sub_category.dart';
import 'package:elancer_momma/screens/detail_product_screen.dart';
import 'package:elancer_momma/widgets/card_product.dart';
import 'package:elancer_momma/widgets/list_tile/menu_list_tile.dart';
import 'package:elancer_momma/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key,required this.subCategory}) : super(key: key);
  final SubCategory subCategory;

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> with Helpers{

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late Future<List<Product>> _future;
  List<Product> _productRead = <Product>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = ProductReadApiController().showProductRead(widget.subCategory.id);
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
          AppLocalizations.of(context)!.products,
          // 'Products',
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
      body: FutureBuilder<List<Product>>(
        future: _future,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
            _productRead = snapshot.data ?? [];
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              itemCount: _productRead.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20.w,
                  crossAxisSpacing: 20.h,
                  childAspectRatio: 235.w / 141.h),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailProductScreen(id: _productRead[index].id),
                      ),
                    );
                  },
                  child: CardProduct(
                      id: _productRead[index].id,
                      image: _productRead[index].imageUrl,
                      title: _productRead[index].productName,
                      subTitle: _productRead[index].infoProduct,
                      price: _productRead[index].price.toString(),
                      overalRate: _productRead[index].overalRate,
                      isFavorite: _productRead[index].isFavorite,
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
