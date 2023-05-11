import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/navigators/navigators.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/cart_page/controller/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.whiteColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
          'Cart',
          style: appBarFont,
        ),
      ),
      body: SafeArea(
        child: Consumer<CartProvider>(
          builder: (context, value, child) => value.loading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: double.infinity,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                )
              : value.cartList == null || value.cartList!.products.isEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      width: double.infinity,
                      child: const Center(
                        child: Text('Cart is empty'),
                      ),
                    )
                  : GridView.builder(
                      itemCount: value.cartList?.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .7 / 1,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: AppColors.black38Color,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          borderOnForeground: true,
                          child: SizedBox(
                            height: 272,
                            width: 145,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        "http://172.16.1.106:5005/products/${value.cartList!.products[index].product.image[0]}"),
                                    fit: BoxFit.fill,
                                    width: 109,
                                    height: 109,
                                  ),
                                  kheight20,
                                  Text(
                                    value
                                        .cartList!.products[index].product.name,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: productNameFont,
                                  ),
                                  kheight5,
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        '₹ ${value.cartList!.products[index].product.discountPrice.toString()}',
                                        style: priceWithcrossing,
                                      ),
                                      kWidth10,
                                      Text(
                                        '₹ ${value.cartList!.products[index].product.price}',
                                        style: productNameFont,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '%${value.cartList!.products[index].product.offer.toString()}',
                                    style: const TextStyle(
                                      letterSpacing: 0.5,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 251, 113, 129),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              value
                                                  .incrementOrDecrementQuantity(
                                                      -1,
                                                      value
                                                          .cartList!
                                                          .products[index]
                                                          .product
                                                          .id,
                                                      value.cartList!
                                                          .products[index].size,
                                                      value.cartList!
                                                          .products[index].qty);
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                              color: AppColors.iconColor,
                                            ),
                                          ),
                                          Text(
                                            value.cartList!.products[index].qty
                                                .toString(),
                                            style: fontStyleB12,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              value
                                                  .incrementOrDecrementQuantity(
                                                      1,
                                                      value
                                                          .cartList!
                                                          .products[index]
                                                          .product
                                                          .id,
                                                      value.cartList!
                                                          .products[index].size,
                                                      value.cartList!
                                                          .products[index].qty);
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              color: AppColors.iconColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            value.removeFromCart(value.cartList!
                                                .products[index].product.id);
                                          },
                                          icon: const Icon(
                                            Icons.delete_forever,
                                            color: AppColors.iconColor,
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
