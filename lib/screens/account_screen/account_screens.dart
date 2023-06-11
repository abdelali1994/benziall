import 'package:ecommerce_with_admin_panel/constants/routes.dart';
import 'package:ecommerce_with_admin_panel/firebase_helper/firebase_auth_helper/firabase_auth_helper.dart';
import 'package:ecommerce_with_admin_panel/provider/app_provider.dart';
import 'package:ecommerce_with_admin_panel/screens/change_password/change_password.dart';
import 'package:ecommerce_with_admin_panel/screens/edit_profile/edit_profile.dart';
import 'package:ecommerce_with_admin_panel/screens/favourite_screen/favourite_screen.dart';
import 'package:ecommerce_with_admin_panel/widgets/Primary_button/primary_button.dart';
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
    AppProvider appProvider = Provider.of<AppProvider>(context);
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
            child: Column(
              children: [
                appProvider.getUserInformation.image == null
                    ? const Icon(
                        Icons.person_outline,
                        size: 70,
                      )
                    : CircleAvatar(
                        backgroundImage:
                            NetworkImage(appProvider.getUserInformation.image!),
                        radius: 50,
                      ),
                Text(
                  appProvider.getUserInformation.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // const SizedBox(
                //   height: 10.0,
                // ),
                Text(
                  appProvider.getUserInformation.email,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: 130,
                  child: PrimaryButton(
                    title: "Edit Profile",
                    onPressed: () {
                      Routes.instance
                          .push(widget: const EditProfile(), context: context);
                    },
                  ),
                ),
              ],
            ),
          ),
          // const SizedBox(
          //   height: 20.0,
          // ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.shopping_bag_outlined),
                  title: const Text("Your Orders"),
                ),
                ListTile(
                  onTap: () {
                    Routes.instance.push(
                        widget: const FavouriteScreen(), context: context);
                  },
                  leading: const Icon((Icons.favorite_outline)),
                  title: const Text("Favorite"),
                ),
                ListTile(
                  onTap: () {
                    Routes.instance
                        .push(widget: const ChangePassword(), context: context);
                  },
                  leading: const Icon(Icons.change_circle_outlined),
                  title: const Text("Change Password"),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.info_outline),
                  title: const Text("About us"),
                ),
                ListTile(
                  onTap: () {
                    FirebaseAuthHelper.instance.signOut();
                    setState(() {});
                  },
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text("Log out"),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text("Version 1.0.0")
              ],
            ),
          )
        ],
      ),
    );
  }
}
