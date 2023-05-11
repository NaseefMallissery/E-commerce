
import 'package:e_commerce/helper/constants/constants.dart';
import 'package:flutter/material.dart';

class ProductsWithRating extends StatelessWidget {
  const ProductsWithRating({
    Key? key,
    required this.image,
    required this.name,
    // required this.rating,
    required this.price,
    required this.offer,
  }) : super(key: key);
final String image;
final String name;
// final double rating;
final String price;
final String offer;
  @override
  Widget build(BuildContext context) {
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
        height: 282,
        width: 165,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: NetworkImage(image),
                fit: BoxFit.fill,
                width: 109,
                height: 109,
              ),
              kheight20,
               Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: productNameFont,
              ),
              kheight5,
              // RatingBar.builder(
              //   initialRating: rating,
              //   minRating: 1,
              //   itemSize: 20,
              //   direction: Axis.horizontal,
              //   allowHalfRating: true,
              //   itemCount: 5,
              //   itemBuilder: (context, _) => const Icon(
              //     Icons.star,
              //     color: Colors.amber,
              //     // size: 12,
              //   ),
              //   onRatingUpdate: (rating) {
              //     log(rating.toString());
              //   },
              // ),
              kheight5,
              const Spacer(),
               Text(
                '₹$price',
                style: productNameFont,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    '$offer% off',
                    style: const TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 251, 113, 129),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_outline,
                      color: AppColors.iconColor,
                      // size: 1,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
