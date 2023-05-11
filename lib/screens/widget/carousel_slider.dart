import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/screens/home_page/model/home_carousal_model.dart';
import 'package:flutter/cupertino.dart';

class CarouselSliderWithDot extends StatelessWidget {
  const CarouselSliderWithDot({
    Key? key,
    required this.carousals,
  }) : super(key: key);
  final List<HomeCarousalModel> carousals;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider.builder(
        itemCount: carousals.length,

        itemBuilder: (context, index, realIndex) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: NetworkImage(
                    "http://172.16.1.106:5005/carousals/${carousals[index].image}"),
                fit: BoxFit.fill,
              ),
            ),
          );
          //   child: Image(
          //     image:
          // );
        },
        // items: imgList.map(
        //   (item) {
        //     return ClipRRect(
        //       borderRadius: const BorderRadius.all(
        //         Radius.circular(5),
        //       ),
        //       child: Stack(
        //         children: [
        //         ,
        // const Padding(
        //   padding: EdgeInsets.only(
        //     top: 15,
        //     left: 15,
        //   ),
        //   child: Text(
        //     'Super Flash Sales\n50% off',
        //     maxLines: 2,
        //     style: TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //       color: AppColors.themeColor,
        //       letterSpacing: 0.5,
        //     ),
        //   ),
        // ),
        options: CarouselOptions(
          // height: 206.0,
          // aspectRatio: 1 / 2,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(milliseconds: 1200),
          enlargeCenterPage: true,
          // onPageChanged: (index, reason) {
          //   setState(() {
          //     _currentIndex = index;
          //   });
          // },
        ),
      )
    ]);

    //   },
    // ).toList(),

    //     Row(
    // //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: widget.carousals.map((url) {
    //         int index = widget.carousals.indexOf(url);
    //         return Container(
    //           width: 8,
    //           height: 8,
    //           margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
    //           decoration: BoxDecoration(
    //               shape: BoxShape.circle,
    //               color: _currentIndex == index
    //                   ? const Color.fromRGBO(0, 0, 0, 0.9)
    //                   : const Color.fromRGBO(0, 0, 0, 0.4)),
    //         );
    //       }).toList(),
    //     )
    //   ],
    // );
  }
}
