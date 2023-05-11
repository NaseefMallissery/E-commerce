import 'package:e_commerce/helper/constants/constants.dart';
import 'package:flutter/material.dart';

class ProdectCardView extends StatelessWidget {
  const ProdectCardView({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.offer,
    required this.onTap,
    // required this.discountPrice,
  }) : super(key: key);
  final String image;
  final String name;
  final String price;
  final String offer;
  final void Function() onTap;
  // final String discountPrice;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Card(
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
          height: 238,
          width: 141,
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
                const Spacer(),
                Row(
                  children: [
                    // Text(discountPrice,style: productNameFont,),
                    Text(
                     '₹$price',
                      style: productNameFont,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '$offer% off',
                  style: const TextStyle(
                      letterSpacing: 0.5,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 251, 113, 129)),
                )
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}
