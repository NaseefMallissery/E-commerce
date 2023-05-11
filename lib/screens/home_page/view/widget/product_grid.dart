import 'package:e_commerce/helper/constants/apiurl.dart';
import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/screens/home_page/controller/provider/home_provider.dart';
import 'package:e_commerce/screens/home_page/view/widget/product_style_2.dart';
import 'package:e_commerce/screens/wish_list/controller/provider/wish_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({
    super.key,
    this.physics,
  });
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    final wishListProvider =
        Provider.of<WishListProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      wishListProvider.getWishListItems();
    });
    return Consumer2<HomePageProvider, WishListProvider>(
        builder: (context, values, values2, _) {
      return GridView.builder(
        physics: physics,
        shrinkWrap: true,
        itemCount: values.productsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
          childAspectRatio: 1.26 / 2,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => values.toProductScreen(
              context,
              values.productsList[index].id,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black26,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image(
                          //   height: 130,
                          //   width: 150,
                          //   fit: BoxFit.fill,
                          //   image: NetworkImage(
                          //     "http://${ApiUrl.apiUrl}:5005/products/${values.productsList[index].image[0]}",
                          //   ),
                          // ),
                          kheight5,
                          Text(values.productsList[index].name ?? ''),
                          kheight5,
                          const Spacer(),
                          ProductDescriptionStyleTwo(
                            // text1:

                            text2: '₹${values.productsList[index].price}',
                            text3: '${values.productsList[index].offer}% off',
                          ),
                          kheight5,
                          Container(
                            width: 45,
                            color: AppColors.greenColor,
                            child: Row(
                              children: [
                                kheight5,
                                Text(
                                  values.productsList[index].rating.toString(),
                                  style: const TextStyle(
                                      color: AppColors.whiteColor),
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: AppColors.whiteColor,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 9, top: 8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => values2.addOrRemoveFromWishList(
                          values.productsList[index].id.toString()),
                      child: Icon(
                        values2.favouriteProducts
                                .contains(values.productsList[index].id)
                            ? Icons.favorite
                            : Icons.favorite_outline_outlined,
                        color: values2.favouriteProducts
                                .contains(values.productsList[index].id)
                            ? AppColors.redColor
                            : AppColors.blackColor,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
