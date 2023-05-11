
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final List<String> product;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider.builder(
        itemCount: product.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(
                    "http://172.16.1.106:5005/products/${product[index]}"),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 250,
          viewportFraction: 1.0,
          // autoPlay: true,
          // autoPlayCurve: Curves.fastOutSlowIn,
          // autoPlayAnimationDuration: const Duration(milliseconds: 1200),
          enlargeCenterPage: true,
        ),
      )
    ]);
  }
}
