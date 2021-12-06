import 'package:card_swiper/card_swiper.dart';
import 'package:elancer_momma/helpers/logout.dart';
import 'package:elancer_momma/widgets/card_categorise.dart';
import 'package:elancer_momma/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with Logout{

  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
            'Home',
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
                  Navigator.pushNamed(context, '/home_screen');
                });
              },
              leading: const Icon(Icons.person_outline,color: Color(0xff23203F),size: 25,),
              title: Text(
                'My Profile',
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
                  Navigator.pushNamed(context, '/home_screen');
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
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20.w),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 10.h,
              maxHeight: 200.h,
              minWidth: double.infinity,
            ),
            child: Swiper(
              onTap: (value){
                Navigator.pushNamed(context, '/details_product_screen');
              },
              duration: 500,
              autoplay: true,
              itemCount: 10,
              viewportFraction: 0.7,
              scale: 0.9,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Image.network(
                          "http://www.hoko.pk/wp-content/uploads/2017/10/FHB-101-1.jpg",
                          fit: BoxFit.fitHeight,
                          height: 200,
                          width: 300,
                        ),
                      ],
                    ),
                  ],
                );
              },
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
                  'Categorise',
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
                    'View All',
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
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  childAspectRatio: 141 / 210),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/sub_categorise_screen');
                  },
                  child: const CardCategorise(
                      image: 'assets/images/Clip.png',
                      title: 'Lorem Ipsum is',
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest Products',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 22.sp,
                    color: const Color(0xff23203f),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/latest_products_screen');
                  },
                  child: Text(
                    'View All',
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
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/details_product_screen');
              },
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 19,
                    childAspectRatio: 141 / 210),
                itemBuilder: (context, index) {
                  return const CardProduct(
                      image: 'assets/images/Clip.png',
                      title: 'Lorem Ipsum is',
                      subTitle: 'subTitle',
                      price: '\$10.00',
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Products you may like',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 22.sp,
                    color: const Color(0xff23203f),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/products_screen');
                  },
                  child: Text(
                    'View All',
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
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, '/details_product_screen');
              },
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 19,
                    childAspectRatio: 141 / 210),
                itemBuilder: (context, index) {
                  return const CardProduct(
                    image: 'assets/images/Clip.png',
                    title: 'Lorem Ipsum is',
                    subTitle: 'subTitle',
                    price: '\$10.00',
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


}

