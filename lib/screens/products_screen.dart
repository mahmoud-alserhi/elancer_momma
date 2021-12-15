import 'package:elancer_momma/api/controllers/product_read_api_controller.dart';
import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/products/product.dart';
import 'package:elancer_momma/models/api/sub_category/sub_category.dart';
import 'package:elancer_momma/screens/detail_product_screen.dart';
import 'package:elancer_momma/widgets/card_product.dart';
import 'package:elancer_momma/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          // AppLocalizations.of(context)!.home,
          'Products',
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
          children: [
            // UserAccountsDrawerHeader(
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: AlignmentDirectional.topStart,
            //         end: AlignmentDirectional.bottomEnd,
            //         colors: [
            //           Color(0xff3d69A8),
            //           Color(0xff6A90F2),
            //         ]),
            //   ),
            //   currentAccountPicture: const CircleAvatar(
            //     backgroundImage: AssetImage(
            //       'assets/images/me.jpg',
            //     ),
            //   ),
            //   currentAccountPictureSize: Size(85.w, 88.h),
            //   accountName: const Text(
            //     'Mahmoud Maher Alserhi',
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            //   accountEmail: const Text(
            //     'Email Dev: mahmoudalserhi@gmail.com',
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            SizedBox(height: 100.h,),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800), () {
                  Navigator.pushNamed(context, '/home_screen');
                });
              },
              leading: const Icon(
                Icons.home_outlined,
                color: Color(0xff23203F),
                size: 25,
              ),
              title: Text(
                'Home',
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
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800), () {
                  Navigator.pushNamed(context, '/update_profile_screen');
                });
              },
              leading: const Icon(
                Icons.person_outline,
                color: Color(0xff23203F),
                size: 25,
              ),
              title: Text(
                'Update Profile',
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
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800), () {
                  Navigator.pushNamed(context, '/change_password_screen');
                });
              },
              leading: const Icon(
                Icons.change_circle_outlined,
                color: Color(0xff23203F),
                size: 25,
              ),
              title: Text(
                'Change Password',
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
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800), () {
                  Navigator.pushNamed(context, '/faqs_screen');
                });
              },
              leading: const Icon(
                Icons.announcement_outlined,
                color: Color(0xff23203F),
                size: 25,
              ),
              title: Text(
                'FAQs',
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
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800), () {
                  Navigator.pushNamed(context, '/about_screen');
                });
              },
              leading: const Icon(
                Icons.info_outline,
                color: Color(0xff23203F),
                size: 25,
              ),
              title: Text(
                'About',
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
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(microseconds: 800), () {
                  Navigator.pushNamed(context, '/contact_screen');
                });
              },
              leading: const Icon(
                Icons.contact_support_outlined,
                color: Color(0xff23203F),
                size: 25,
              ),
              title: Text(
                'Contact Us',
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
            // Divider(
            //   color: const Color(0xff6A90F2),
            //   thickness: 1,
            //   endIndent: 25.w,
            // ),
            ListTile(
              onTap: () async {
                Navigator.pop(context);
                await logOut(context);
              },
              leading: const Icon(
                Icons.logout,
                color: Color(0xff23203F),
                size: 25,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 19.sp,
                  color: const Color(0xff23203F),
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
                            DetailProductScreen(product: _productRead[index]),
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
            return widgetNoData();
          }
        },
      ),
    );
  }
}
