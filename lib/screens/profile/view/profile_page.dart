import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/navigators/navigators.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              popNavigator(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.iconColor,
            )),
        title: const Text(
          'Profile',
          style: appBarFont,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          kheight15,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Name',
                  style: tileTextFont,
                ),
                kheight5,
                Text(
                  'name@gmail.com',
                  style: fontStyle12b54,
                ),
                ListTile(
                  leading: Icon(Icons.person_outline_sharp),
                  title: Text(
                    'Name',
                    style: fontStyleB12,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
