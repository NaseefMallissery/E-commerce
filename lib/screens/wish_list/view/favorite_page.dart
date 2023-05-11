import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/navigators/navigators.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/cart_page/controller/provider/cart_provider.dart';
import 'package:e_commerce/screens/home_page/controller/provider/home_provider.dart';
import 'package:e_commerce/screens/wish_list/view/widget/style_discri.dart';
import 'package:e_commerce/screens/wish_list/controller/provider/wish_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              popNavigator(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.iconColor,
            ),
          ),
          title: const Text(
            'Wish List',
            style: appBarFont,
          ),
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            Consumer3<WishListProvider, HomePageProvider, CartProvider>(
              builder: (context, wishListValues, homeValues, cartValues, _) {
                return wishListValues.loading == true
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        width: double.infinity,
                        child: const Center(
                          child: LoadingWidget(),
                        ),
                      )
                    : wishListValues.wishList == null ||
                            wishListValues.wishList!.products.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height / 1.2,
                            child: const Center(
                              child: Text('WishList is empty'),
                            ),
                          )
                        : Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    wishListValues.wishList!.products.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 8,
                                  childAspectRatio: 1.5 / 2,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => homeValues.toProductScreen(
                                        context,
                                        wishListValues.wishList!.products[index]
                                            .product.id),
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            // color: Colors.black26,
                                            border: Border.all(
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 12.0, horizontal: 8),
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image(
                                                    height: 130,
                                                    width: 180,
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        "http://172.16.1.106:5005/products/${wishListValues.wishList!.products[index].product.image[0]}"),
                                                  ),
                                                  kheight15,
                                                  Text(
                                                    wishListValues
                                                        .wishList!
                                                        .products[index]
                                                        .product
                                                        .name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  kheight5,
                                                  ProductTextdesciptionStyle(
                                                    text1:
                                                        "₹${wishListValues.wishList!.products[index].product.discountPrice}",
                                                    text2:
                                                        '₹${wishListValues.wishList!.products[index].product.price}',
                                                    text3:
                                                        '${wishListValues.wishList!.products[index].product.offer}% off',

                                                  ),
                                                  kheight5,
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10, top: 13),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: GestureDetector(
                                              onTap: () => wishListValues
                                                  .addOrRemoveFromWishList(
                                                      wishListValues
                                                          .wishList!
                                                          .products[index]
                                                          .product
                                                          .id),
                                              child: const Icon(
                                                Icons.favorite,
                                                color: AppColors.redColor,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
              },
            )
          ],
        ),
      ),
    );
  }
}
