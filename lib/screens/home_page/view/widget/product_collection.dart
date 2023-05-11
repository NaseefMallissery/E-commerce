import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/utils/loading_widget.dart';
import 'package:e_commerce/screens/home_page/controller/provider/home_provider.dart';
import 'package:e_commerce/screens/home_page/view/widget/product_grid.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCollectionScreen extends StatelessWidget {
  const ProductCollectionScreen({
    super.key,
    required this.category,
    required this.categoryId,
  });
  final String category;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    final homeProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeProvider.getProductsByCategory(categoryId);
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0,
          title: Text(category),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
        ),
        body: Consumer<HomePageProvider>(builder: (context, values, _) {
          return values.loading == true
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  width: double.infinity,
                  child: const Center(
                    child: LoadingWidget(),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Expanded(
                        child: GridViewProducts(),
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
