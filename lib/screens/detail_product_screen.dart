import 'package:card_swiper/card_swiper.dart';
import 'package:elancer_momma/api/controllers/favorite_product_api_controller.dart';
import 'package:elancer_momma/api/controllers/product_details_api_controller.dart';
import 'package:elancer_momma/api/controllers/rate_product_api_controller.dart';
import 'package:elancer_momma/get/favorite_product_getx_controller.dart';
import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/models/api/home/product.dart';
import 'package:elancer_momma/models/api/products/product.dart';
import 'package:elancer_momma/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key, required this.id})
      : super(key: key);
  // final Product product;
  final int id;

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  // ProductDetailsGetxController controller =
  //     Get.put(ProductDetailsGetxController());

  late Future<Product?> _future;

  bool _isFavorite = false;

  late double _rating;
  IconData? _selectedIcon;
  double _initialRating = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future =
        ProductDetailsApiController().showProductDetails(widget.id);
    FavoriteProductGetxController.to.getFavoriteProduct();
    _rating = _initialRating;
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
          AppLocalizations.of(context)!.detailsProduct,
          // 'Details Product',
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
      ),
      body: FutureBuilder<Product?>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
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
                  child: snapshot.data!.images.isNotEmpty
                      ? Swiper(
                          duration: 500,
                          autoplay: true,
                          itemCount: snapshot.data!.images.length,
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
                                          snapshot.data!.images[index].imageUrl,
                                          // widget.product.imageUrl[index],
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              snapshot.data!.productName,
                              // "Lorem Ipsum is",
                              // overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 19.sp,
                                color: const Color(0xff23203F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "\$${snapshot.data!.price}",
                            // "\$${widget.product!.price}",
                            // "\$10.00",
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 19.sp,
                              color: const Color(0xff23203F),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.quantity}: ${snapshot.data!.quantity}',
                            // 'Quantity: ${widget.product!.quantity}',
                            // 'Quantity: 5',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 20.sp,
                              color: const Color(0xff6A90F2),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          RatingBar.builder(
                            glow: false,
                            // glowColor: Colors.amber,
                            initialRating: _initialRating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 24,
                            updateOnDrag: true,
                            itemBuilder: (context, _) => Icon(
                              _selectedIcon ?? Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              RateProductApiController().rateProduct(
                                  context,
                                  productId: widget.id,
                                  rate: _rating
                              );
                              print(rating);
                              setState(() {
                                _rating = rating;
                              });
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.itemDescription}:',
                            // 'Item Description:',
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 20.sp,
                              color: const Color(0xff23203F),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  FavoriteProductApiController().postFavorite(
                                      context,
                                      productId: widget.id);
                                  setState(() {
                                    _isFavorite
                                        ? _isFavorite = false
                                        : _isFavorite = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: _isFavorite || snapshot.data!.isFavorite ? const Color(0xffFF0000) : const Color(0xffB0B0B0),
                                  // color: Colors.red,
                                  // color: _isFavorite ? Colors.red : const Color(0xffB0B0B0),
                                  // color: const Color(0xffFF0000),
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),
                              Text(
                                '${snapshot.data!.overalRate}',
                                // "overal rate",
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 20.sp,
                                  color: const Color(0xff716F87),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 24.w,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        snapshot.data!.infoProduct,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 50,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20.sp,
                          color: const Color(0xff716F87),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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
