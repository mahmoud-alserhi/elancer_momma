import 'package:elancer_momma/get/favorite_product_getx_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with Helpers{

  // FavoriteProductGetxController _favoriteProductGetxController = Get.put(FavoriteProductGetxController());
  @override
  void initState() {
    // TODO: implement initState
    FavoriteProductGetxController.to.getFavoriteProduct();
    super.initState();
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
          // AppLocalizations.of(context)!.home,
          'Favorite',
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
            onPressed: () {},
            icon: const Icon(
              Icons.language,
              color: Color(0xff23203f),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                      Color(0xff3d3868),
                      Color(0xff6A90F2),
                    ]),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/me.jpg',),
              ),
              currentAccountPictureSize: Size(85,88),
              accountName: Text(
                'Mahmoud Maher Alserhi',
                style: TextStyle(
                  color: Colors.white,
                  // color: Color(0xff23203F),
                  // fontFamily: 'Nunito',
                ),
              ),
              accountEmail: Text(
                'mahmoudalserhi@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  // fontFamily: 'Nunito',
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800),(){
                  Navigator.pushNamed(context, '/home_screen');
                });
              },
              leading: const Icon(Icons.home_outlined,color: Color(0xff23203F),size: 25,),
              title: Text(
                'Home',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 19.sp,
                  color: const Color(0xff23203F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xff23203F),),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800),(){
                  Navigator.pushNamed(context, '/update_profile_screen');
                });
              },
              leading: const Icon(Icons.person_outline,color: Color(0xff23203F),size: 25,),
              title: Text(
                'Update Profile',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 19.sp,
                  color: const Color(0xff23203F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xff23203F),),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800),(){
                  Navigator.pushNamed(context, '/change_password_screen');
                });
              },
              leading: const Icon(Icons.change_circle_outlined,color: Color(0xff23203F),size: 25,),
              title: Text(
                'Change Password',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 19.sp,
                  color: const Color(0xff23203F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xff23203F),),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800),(){
                  Navigator.pushNamed(context, '/faqs_screen');
                });
              },
              leading: const Icon(Icons.announcement_outlined,color: Color(0xff23203F),size: 25,),
              title: Text(
                'FAQs',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 19.sp,
                  color: const Color(0xff23203F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xff23203F),),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800),(){
                  Navigator.pushNamed(context, '/home_screen');
                });
              },
              leading: const Icon(Icons.info_outline,color: Color(0xff23203F),size: 25,),
              title: Text(
                'About',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 19.sp,
                  color: const Color(0xff23203F),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xff23203F),),
            ),
            const Divider(
              color: Color(0xff6A90F2),
              thickness: 1,
              endIndent: 25,
            ),
            ListTile(
              onTap: () async{
                Navigator.pop(context);
                await logOut(context);
              },
              leading: const Icon(Icons.logout,color: Color(0xff23203F),size: 25,),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 19.sp,
                  color: const Color(0xff23203F),
                  fontWeight: FontWeight.bold,
                ),
              ),),
          ],
        ),
      ),
      body: GetBuilder<FavoriteProductGetxController>(
        builder: (controller) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.favoriteProducts.isNotEmpty) {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              itemCount: controller.favoriteProducts.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 20.w,
                  childAspectRatio: 240.w / 141.h),
              itemBuilder: (context, index) {
                return CardProduct(
                  id: controller.favoriteProducts[index].id,
                  image: controller.favoriteProducts[index].imageUrl,
                  title: controller.favoriteProducts[index].favoriteProductName,
                  subTitle: controller.favoriteProducts[index].favoriteInfoProduct,
                  price: '${controller.favoriteProducts[index].price}',
                  overalRate: controller.favoriteProducts[index].overalRate,
                  isFavorite: controller.favoriteProducts[index].isFavorite,
                  favoriteButton: true,
                  // isFavorite: true,
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'No Data',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff23203F),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

