import 'package:card_swiper/card_swiper.dart';
import 'package:elancer_momma/get/favorite_product_getx_controller.dart';
import 'package:elancer_momma/get/home_getx_controller.dart';
import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/screens/sub_categorise_screen.dart';
import 'package:elancer_momma/widgets/card_categorise_home.dart';
import 'package:elancer_momma/widgets/card_product.dart';
import 'package:elancer_momma/widgets/list_tile/menu_list_tile.dart';
import 'package:elancer_momma/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'detail_product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Helpers {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeGetxController _homeGetxController = Get.put(HomeGetxController());
  FavoriteProductGetxController _favoriteProductGetxController = Get.put(FavoriteProductGetxController());

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
          AppLocalizations.of(context)!.home,
          // 'Home',
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
              Navigator.pushNamed(context, '/favorite_screen');
            },
            icon: const Icon(
              Icons.favorite,
              color: Color(0xffFF0000),
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     setState(() {
          //       LanguageGetxController.to.changeLanguage();
          //     });
          //   },
          //   icon: const Icon(
          //     Icons.language,
          //     color: Color(0xff23203f),
          //   ),
          // ),
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
      body: GetBuilder<HomeGetxController>(
        builder: (controller) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.homeResponse != null) {
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 20.w),
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10.h,
                    maxHeight: 200.h,
                    minWidth: double.infinity,
                  ),
                  child: controller.homeResponse!.slider.isNotEmpty
                      ? Swiper(
                          onTap: (value) {
                            // Navigator.pushNamed(
                            //     context, '/details_product_screen');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailProductScreen(id: controller.homeResponse!.slider[value].objectId),
                              ),
                            );
                          },
                          duration: 500,
                          autoplay: true,
                          itemCount: controller.homeResponse!.slider.length,
                          viewportFraction: 0.7,
                          scale: 0.8,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: SizedBox(
                                        height: 200.h,
                                        width: double.infinity,
                                        child: Image.network(
                                          controller
                                              .homeResponse!.slider[index].imageUrl,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        )
                      : const Center(
                          child: Text("no Data"),
                        ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.categorise,
                        // 'Categorise',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 22.sp,
                          color: const Color(0xff23203f),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/categorise_screen');
                        },
                        child: Text(
                          AppLocalizations.of(context)!.viewAll,
                          // 'View All',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: const Color(0xff6A90F2),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10.h,
                    maxHeight: 200.h,
                    minWidth: double.infinity,
                  ),
                  child: controller.homeResponse!.categories.isNotEmpty
                      ? GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          itemCount: controller.homeResponse!.categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 20.h,
                                  childAspectRatio: 131.w / 210.h),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, '/sub_categorise_screen');
                                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            SubCategoriseScreen(id: controller.homeResponse!.categories[index].id),
                                      ),
                                    );
                              },
                              child: CardCategoriseHome(
                                image: controller
                                    .homeResponse!.categories[index].imageUrl,
                                title: controller.homeResponse!
                                    .categories[index].categoryName,
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text("no Data"),
                        ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.latestProducts,
                        // 'Latest Products',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 22.sp,
                          color: const Color(0xff23203f),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(
                      //         context, '/latest_products_screen');
                      //   },
                      //   child: Text(
                      //     'View All',
                      //     style: TextStyle(
                      //       fontFamily: 'Nunito',
                      //       color: const Color(0xff6A90F2),
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 18.sp,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10.h,
                    maxHeight: 200.h,
                    minWidth: double.infinity,
                  ),
                  child: controller.homeResponse!.latestProducts.isNotEmpty
                      ? GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        itemCount:
                            controller.homeResponse!.latestProducts.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 20.h,
                                childAspectRatio: 131.w / 210.h),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailProductScreen(id: controller.homeResponse!.latestProducts[index].id),
                                ),
                              );
                            },
                            child: CardProduct(
                              id: controller.homeResponse!
                                  .latestProducts[index].id,
                              image: controller.homeResponse!
                                  .latestProducts[index].imageUrl,
                              title: controller.homeResponse!
                                  .latestProducts[index].productName,
                              subTitle: controller.homeResponse!
                                  .latestProducts[index].infoProduct,
                              price: controller
                                  .homeResponse!.latestProducts[index].price
                                  .toString(),
                              isFavorite: controller.homeResponse!
                                  .famousProducts[index].isFavorite,
                              overalRate: controller.homeResponse!
                                  .famousProducts[index].overalRate,
                            ),
                          );
                        },
                      )
                      : const Center(
                          child: Text("no Data"),
                        ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                    AppLocalizations.of(context)!.famousProducts,
                        // 'Famous Products',
                        // 'Products you may like',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 22.sp,
                          color: const Color(0xff23203f),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // TextButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, '/products_screen');
                      //   },
                      //   child: Text(
                      //     'View All',
                      //     style: TextStyle(
                      //       fontFamily: 'Nunito',
                      //       color: const Color(0xff6A90F2),
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 18.sp,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 10.h,
                    maxHeight: 200.h,
                    minWidth: double.infinity,
                  ),
                  child: controller.homeResponse!.famousProducts.isNotEmpty
                      ? GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        itemCount: controller.homeResponse!.famousProducts.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 20.h,
                                childAspectRatio: 131.w / 210.h),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailProductScreen(id: controller.homeResponse!.latestProducts[index].id),
                                ),
                              );
                            },
                            child: CardProduct(
                              id: controller.homeResponse!
                                  .latestProducts[index].id,
                              image: controller.homeResponse!
                                  .famousProducts[index].imageUrl,
                              title: controller.homeResponse!
                                  .famousProducts[index].productName,
                              subTitle: controller.homeResponse!
                                  .famousProducts[index].infoProduct,
                              price: controller.homeResponse!
                                  .famousProducts[index].price.toString(),
                              isFavorite: controller.homeResponse!
                                  .famousProducts[index].isFavorite,
                              overalRate: controller.homeResponse!
                                  .famousProducts[index].overalRate,
                            ),
                          );
                        },
                      )
                      : const Center(
                          child: Text("no Data"),
                        ),
                ),
              ],
            );
          } else {
            return widgetNoData(context);
          }
        },
      ),
    );
  }
}
