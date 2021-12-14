import 'package:elancer_momma/api/controllers/sub_category_api_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/categories/category.dart';
import 'package:elancer_momma/models/api/sub_category/sub_category.dart';
import 'package:elancer_momma/screens/products_screen.dart';
import 'package:elancer_momma/widgets/card_sub_categorise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoriseScreen extends StatefulWidget {
  const SubCategoriseScreen({Key? key,required this.category}) : super(key: key);
  final Category category;

  @override
  _SubCategoriseScreenState createState() => _SubCategoriseScreenState();
}

class _SubCategoriseScreenState extends State<SubCategoriseScreen> with Helpers{

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late Future<List<SubCategory>> _future;
  List<SubCategory> _subCategories = <SubCategory>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = SubCategoryApiController().showSubCategory(widget.category.id);
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
          'Sub Categorise',
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
            Divider(
              color: const Color(0xff6A90F2),
              thickness: 1,
              endIndent: 25.w,
            ),
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
      body: FutureBuilder<List<SubCategory>>(
        future: _future,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else if(snapshot.hasData && snapshot.data!.isNotEmpty){
            _subCategories = snapshot.data ?? [];
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              itemCount: _subCategories.length,
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
                            ProductsScreen(subCategory: _subCategories[index]),
                      ),
                    );
                  },
                  child: CardSubCategorise(
                    image: _subCategories[index].imageUrl,
                    title: _subCategories[index].categoryName,
                    productCount: _subCategories[index].productsCount,
                  ),
                );
              },
            );
          }else{
            return Center(
              child: Column(
                children: const [
                  Icon(Icons.warning, size: 80),
                  Text(
                    'NO DATA',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}



