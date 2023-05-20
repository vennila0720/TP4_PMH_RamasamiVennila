import 'package:ecommerce_app/constants/routes.dart';
import 'package:ecommerce_app/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommerce_app/provider/app_provider.dart';
import 'package:ecommerce_app/screens/change_password/change_password.dart';
import 'package:ecommerce_app/screens/check_out/check_out.dart';
import 'package:ecommerce_app/screens/favourite_screen/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Account",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Icon(
                    Icons.person_2_outlined,
                    size: 150,
                  ),
                  Text(
                    appProvider.getUserInformation.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    appProvider.getUserInformation.email,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: Icon(Icons.shopping_bag_outlined),
                    title: Text("Your Orders"),
                  ),
                  ListTile(
                    onTap: () {
                      Routes.instance
                          .push(widget: FavouriteScreen(), context: context);
                    },
                    leading: Icon(Icons.favorite_border_outlined),
                    title: Text("Favourite"),
                  ),
                  ListTile(
                    onTap: () {
                      Routes.instance.push(
                          widget: const ChangePassword(), context: context);
                    },
                    leading: Icon(Icons.change_circle_outlined),
                    title: Text("Change Password"),
                  ),
                  ListTile(
                    onTap: () {
                      FirebaseAuthHelper.instance.signOut();
                      setState(() {});
                    },
                    leading: Icon(Icons.exit_to_app_outlined),
                    title: Text("Log out"),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text("Version 1.2.0")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
