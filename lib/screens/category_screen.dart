import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/widgets/card_categorise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with Helpers{

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
          'Categorise',
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
      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 171 / 210),
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
    );
  }
}