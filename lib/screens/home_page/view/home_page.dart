import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/navigators/navigators.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/home_page/controller/provider/home_provider.dart';
import 'package:e_commerce/screens/home_page/view/widget/category_icon.dart';
import 'package:e_commerce/screens/home_page/view/widget/product_card_view.dart';
import 'package:e_commerce/screens/widget/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomePageProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            profilePageNavigator(context);  
          },
          icon: const Icon(
            Icons.menu,
            color: AppColors.iconColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              favoritePageNavigator(context);
            },
            icon: const Icon(
              Icons.favorite_border,
              color: AppColors.iconColor,
            ),
          ),
          IconButton(
            onPressed: () {
              cartPageNavigator(context);
            },
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.iconColor,
            ),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8.0),
        child: Consumer<HomePageProvider>(
          builder: (context, value, _) => value.loading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                )
              : value.carousalList.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Center(
                        child: IconButton(
                          onPressed: () => value.callFunctions(),
                          icon: const Icon(Icons.refresh),
                        ),
                      ),
                    )
                  : ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CarouselSliderWithDot(
                                carousals: value.carousalList),
                            kheight30,
                            categoryHeadingText(
                              "Categories",
                            ),
                            kheight20,
                            SizedBox(
                              height: 120,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CategoryIcon(
                                    imagePath:
                                        ("http://172.16.1.106:5005/category/${value.categoryList[index].image}"),
                                    text: value.categoryList[index].name,
                                    ontap: () =>
                                        homeProvider.toCollectionScreen(
                                      context,
                                      value.categoryList[index].name,
                                      value.categoryList[index].id,
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 20,
                                ),
                                itemCount: value.categoryList.length,
                              ),
                            ),
                            kheight20,
                            categoryHeadingText(
                              'Products',
                            ),
                            kheight10,
                            SizedBox(
                              height: 238,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 7.5,
                                      ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: value.productsList.length,
                                  itemBuilder: (context, index) {
                                    return ProdectCardView(
                                      image:
                                          ("http://172.16.1.106:5005/products/${value.productsList[index].image![0]}"),
                                      name: value.productsList[index].name
                                          .toString()
                                          .toUpperCase(),
                                      price: value.productsList[index].price
                                          .toString(),
                                      // discountPrice:value.productsList[index].
                                      offer: value.productsList[index].offer
                                          .toString(),
                                      onTap: () {
                                        value.toProductScreen(context,
                                            value.productsList[index].id);
                                      },
                                    );
                                  }),
                            ),
                            kheight30,
                            // categoryHeadingText(
                              // 'Sneakers',
                            // ),
                            kheight10,
                          ],
                        ),
                      ],
                    ),
        ),
      ),
    );
  }

  Row categoryHeadingText(
    String first,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.2),
          child: Text(
            first,
            style: mainFontStyle,
          ),
        ),
        // Text(
        //   second,
        //   style: mainFontStyle,
        // )
      ],
    );
  }
}
