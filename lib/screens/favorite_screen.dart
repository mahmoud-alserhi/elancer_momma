import 'package:elancer_momma/helpers/logout.dart';
import 'package:elancer_momma/widgets/card_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with Logout{

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
      body: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, '/details_product_screen');
        },
        child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 240 / 141),
          itemBuilder: (context, index) {
            return const CardProduct(
              image: 'assets/images/Clip.png',
              title: 'Lorem Ipsum is',
              subTitle: 'subTitle',
              price: '\$10.00',
              // isFavorite: true,
            );
          },
        ),
      ),
    );
  }
}
