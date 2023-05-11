import 'package:e_commerce/helper/constants/constants.dart';
import 'package:e_commerce/helper/navigators/navigators.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Account",
          style: appBarFont,
        ),
      ),
      body: Column(
        children: [
          const Divider(),
          Column(
            children:  [
              ListTile(
                leading: const Icon(
                  Icons.person_outline_rounded,
                  size: 24,
                ),
                title: const Text(
                  "Profile",
                  style: listTileFontB12,
                ),
                onTap: () => profilePageNavigator(context),
              ),
              const ListTile(
                leading: Icon(
                  Icons.shopping_cart_outlined,
                  size: 24,
                ),
                title: Text(
                  "Order",
                  style: listTileFontB12,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.location_on_outlined,
                  size: 24,
                ),
                title: Text(
                  "Address",
                  style: listTileFontB12,
                ),
              ),
              const ListTile(
                leading: Icon(
                  Icons.payment,
                  size: 24,
                ),
                title: Text(
                  "Payment",
                  style: listTileFontB12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
