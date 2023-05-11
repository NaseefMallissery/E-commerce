import 'dart:developer';

import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/navigators/navigators.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/cart_page/controller/provider/cart_provider.dart';
import 'package:e_commerce/screens/product_view/controller/provider/payment_screen_provider.dart';
import 'package:e_commerce/screens/product_view/controller/provider/product_provider.dart';
import 'package:e_commerce/screens/product_view/view/widget/carousal_widget.dart';
import 'package:e_commerce/screens/wish_list/controller/provider/wish_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

final List<String> imgList = [
  'asset/images/merlin_186039729_cdb846bf-dc3f-49cf-8552-e3992140338b-mobileMasterAt3x.jpg',
  'asset/images/Nike Air Max 90 SE.webp',
  'asset/images/nike-air-jordan-1.webp',
  'asset/images/shoe1.jpg',
  'asset/images/shoes2.jpg'
];

class ProductViewPage extends StatelessWidget {
  const ProductViewPage({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      provider.getOneProduct(productId);
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            popNavigator(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.iconColor,
          ),
        ),
        // title:  Text(
        //   provider.product.name!,
        //   style: appBarFont,
        //   maxLines: 1,
        //   overflow: TextOverflow.ellipsis,
        // ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.add_shopping_cart_outlined,
        //       color: AppColors.iconColor,
        //     ),
        //   ),
        // ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(10),
        child: Consumer3<ProductProvider, WishListProvider, CartProvider>(
          builder: (context, value, value2, value3, child) {
            final product = value.product;
            return value.loading == true
                ? const SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: Center(
                      child: LoadingWidget(),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSliderWidget(product: product!.image!),
                      kheight20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.name!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: productViewName,
                              // style: fontStyleB12,
                            ),
                          ),
                          IconButton(
                            onPressed: () => value2.addOrRemoveFromWishList(
                                value.product!.id.toString()),
                            icon: Icon(
                              value2.favouriteProducts
                                      .contains(value.product!.id)
                                  ? Icons.favorite
                                  : Icons.favorite_outline_outlined,
                              color: value2.favouriteProducts
                                      .contains(value.product!.id)
                                  ? AppColors.redColor
                                  : AppColors.blackColor,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                      kheight10,
                      RatingBar.builder(
                        initialRating: double.parse(value.product!.rating!),
                        minRating: 1,
                        itemSize: 40,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          // size: 12,
                        ),
                        onRatingUpdate: (rating) {
                          log(rating.toString());
                        },
                      ),
                      kheight10,
                      Row(
                        children: [
                          //  Text(
                          //     "₹${product.price!}",
                          //     style: priceWithcrossing,
                          //   ),
                          Text(
                            "₹${product.price!}",
                            style: productViewName,
                          ),
                        ],
                      ),
                      kheight20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Select Size",
                            style: font14ThemeTextcolor,
                          ),
                          Text(
                            "US",
                            style: font14Greycolor,
                          )
                        ],
                      ),
                      kheight20,

                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                              // width: 10,
                              ),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: value.product!.size!.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                value.sizeSelect(index);
                              },
                              child: Container(
                                height: 100,
                                width: 90,
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(100),
                                    border: value.sizeChartIndex == index
                                        ? Border.all(
                                            color: AppColors.themeColor,
                                            width: 2.5)
                                        : Border.all(
                                            color: AppColors.greyColor,
                                            width: 2.5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white60.withOpacity(0.9),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ]),
                                child: Text(
                                  value.product!.size![index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // kheight30,
                      // const Text(
                      //   "Select Color",
                      //   style: font14ThemeTextcolor,
                      // ),
                      kheight10,
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.themeColor,
                            ),
                            onPressed: () =>
                                value3.cartItemsId.contains(value.product?.id)
                                    ? value.goToCart(context)
                                    : value3.addToCart(
                                        value.product!.id.toString(),
                                        value.productSize,
                                      ),
                            child:
                                value3.cartItemsId.contains(value.product?.id)
                                    ? const Text(
                                        "Go to cart",
                                        style: fontStyleB14,
                                      )
                                    : const Text(
                                        "Add to cart",
                                        style: fontStyleB14,
                                      ),
                          ),
                          kWidth10,
                          Consumer<PaymentProvider>(
                            builder: (context, value, child) => ElevatedButton(
                              onPressed: () {
                                value.razorpayOption(
                                    int.parse(product.price!.toString()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.themeColor,
                              ),
                              child: const Text(
                                'Purchase Now',
                                style: fontStyleB14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

// class SizeCircleAvatar extends StatelessWidget {
//   const SizeCircleAvatar({
//     Key? key,
//     required this.size,
//     // required this.onTap,
//   }) : super(
//           key: key,
//         );
//   final String size;
//   // final Function onTap;
//   @override
//   Widget build(BuildContext context,index) {
//     return Consumer<ProductProvider>(
//       builder: (context, value, child) =>InkWell(
//         onTap: () {
//            value.setSizeIndex(index);
//         },
//         child: CircleAvatar(
//           radius: 25,
//           backgroundColor:,
//           child: CircleAvatar(
//             radius: 23,
//             backgroundColor: AppColors.whiteColor,
//             child: Text(
//               size,
//               style: fontStyleB14,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
