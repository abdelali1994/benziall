import 'package:ecommerce_with_admin_panel/screens/auth_ui/sign_up/sign_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/asset_images.dart';
import '../../../constants/routes.dart';
import '../../../widgets/Primary_button/primary_button.dart';
import '../../../widgets/top_titles/top_titles.dart';
import '../login/login.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Toptitles(
                title: 'Welcome again',
                subtitle: 'Buy any items From Using App',
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Image.asset(
                  AssetsImages.instance.welcomeImage,
                  alignment: Alignment.center,
                  width: 250,
                  height: 250,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.facebook,
                      size: 35,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  CupertinoButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      AssetsImages.instance.googleLogo,
                      scale: 80.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30.0,
              ),
              PrimaryButton(
                title: "LOGIN",
                onPressed: () {
                  Routes.instance.push(widget: const Login(), context: context);
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              PrimaryButton(
                title: "SIGN UP",
                onPressed: () {
                  Routes.instance.push(widget: const SignUp(), context: context);
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
