import 'package:elancer_momma/get/favorite_product_getx_controller.dart';
import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/widgets/card_product.dart';
import 'package:elancer_momma/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          AppLocalizations.of(context)!.favorite,
          // 'Favorite',
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
            return widgetNoData(context);
          }
        },
      ),
    );
  }
}

