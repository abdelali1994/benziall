// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_with_admin_panel/constants/constants.dart';
import 'package:ecommerce_with_admin_panel/firebase_helper/firebase_auth_helper/firabase_auth_helper.dart';
import 'package:ecommerce_with_admin_panel/screens/home/home.dart';
import 'package:ecommerce_with_admin_panel/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/routes.dart';
import '../../../widgets/Primary_button/primary_button.dart';
import '../sign_up/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Toptitles(
                  title: "Login", subtitle: "welcome back to E-commerce App"),
              const SizedBox(
                height: 45.0,
              ),
              TextFormField(
                 controller: email,
                decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    )),
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                 controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(
                    Icons.password_sharp,
                  ),
                  suffixIcon: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.visibility,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              PrimaryButton(
                title: 'Login',
                onPressed: () async {
                  bool isVaildated = loginVaildation(email.text, password.text);
                  if (isVaildated) {
                   
                    bool isLogined = await FirebaseAuthHelper.instance
                        .login(email.text, password.text, context);
                    if (isLogined) {
                      Routes.instance.pushAndRemoveUntil(
                          widget: const Home(), context: context);
                    }
                  } 
                },
                // onPressed: () async {
                //   bool isVaildated = loginValidation(email.text, password.text);
                //   if (isVaildated) {
                //     bool isLogined = await FirebaseAuthHelper.instance
                //         .login(email.text, password.text, context);
                //     if (isLogined) {
                //       Routes.instance
                //           .pushAndRemoveUntil(widget:const Home(), context: context);
                //     }
                //   }
                // },
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Center(child: Text("Don't have an Account?")),
              const SizedBox(
                height: 15.0,
              ),
              Center(
                child: CupertinoButton(
                  onPressed: () {
                    Routes.instance
                        .push(widget: const SignUp(), context: context);
                  },
                  child: Text(
                    'Create an account',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
