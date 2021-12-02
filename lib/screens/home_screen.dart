import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          // onPressed: () => Scaffold.of(context).openDrawer(),
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
              color: Color(0xff23203f),
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
              onTap: (){
                Navigator.pop(context);
                Future.delayed(const Duration(seconds: 1),(){
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login_screen', (route) => true);
                });
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
              // onTap: (value){},
              duration: 500,
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Image.network(
                          "http://www.hoko.pk/wp-content/uploads/2017/10/FHB-101-1.jpg",
                          // "https://images.unsplash.com/photo-1595445364671-15205e6c380c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=764&q=80",
                          fit: BoxFit.fitHeight,
                          height: 200,
                          width: 300,
                        ),
                        // Container(
                        //   decoration: const BoxDecoration(
                        //     color: Color.fromARGB(180, 255, 255, 255),
                        //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                        //   ),
                        //   height: 70.h,
                        //   width: double.infinity,
                        //   child: const Padding(
                        //     padding: EdgeInsets.all(10),
                        //     child: Text(
                        //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                        //         // textAlign: TextAlign.right,
                        //         maxLines: 2,
                        //         style: TextStyle(
                        //             fontSize: 15, fontWeight: FontWeight.bold)),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                );
              },
              itemCount: 10,
              viewportFraction: 0.7,
              scale: 0.9,
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
                  onPressed: () {},
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
              maxHeight: 252.h,
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
                  childAspectRatio: 212 / 141),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Clip.png',
                        fit: BoxFit.fitHeight,
                        height: 190,
                      ),
                      SizedBox(
                        height: 45.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              Text(
                                  "Lorem Ipsum is",
                                  // textAlign: TextAlign.right,
                                  maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15.sp,
                                  color: const Color(0xff23203F),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$10.00",
                                // textAlign: TextAlign.right,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15.sp,
                                  color: const Color(0xff716F87),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                  onPressed: () {},
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
              maxHeight: 252.h,
              minWidth: double.infinity,
            ),
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 19,
                  childAspectRatio: 212 / 141),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Clip.png',
                        fit: BoxFit.fitHeight,
                        height: 190,
                      ),
                      SizedBox(
                        height: 45.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              Text(
                                "Lorem Ipsum is",
                                // textAlign: TextAlign.right,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15.sp,
                                  color: const Color(0xff23203F),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$10.00",
                                // textAlign: TextAlign.right,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15.sp,
                                  color: const Color(0xff716F87),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                  'Products you may like',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 22.sp,
                    color: const Color(0xff23203f),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
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
              maxHeight: 252.h,
              minWidth: double.infinity,
            ),
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 19,
                  childAspectRatio: 212 / 141),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/Clip.png',
                        fit: BoxFit.fitHeight,
                        height: 190,
                      ),
                      SizedBox(
                        height: 45.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Column(
                            children: [
                              Text(
                                "Lorem Ipsum is",
                                // textAlign: TextAlign.right,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15.sp,
                                  color: const Color(0xff23203F),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$10.00",
                                // textAlign: TextAlign.right,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15.sp,
                                  color: const Color(0xff716F87),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
