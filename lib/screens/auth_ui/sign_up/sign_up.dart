// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce_with_admin_panel/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/routes.dart';
import '../../../firebase_helper/firebase_auth_helper/firabase_auth_helper.dart';
import '../../../widgets/Primary_button/primary_button.dart';
import '../../home/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  bool isShowPassword = true;
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
 
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset:false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Toptitles(
                    title: "Create Account",
                    subtitle: "welcome to Ben ALL Store"),
                const SizedBox(
                  height: 45.0,
                ),
                TextFormField(
                   controller: name,
                  decoration: const InputDecoration(
                      hintText: "Name",
                      prefixIcon: Icon(
                        Icons.person_outline,
                      )),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: phone,
                  decoration: const InputDecoration(
                      hintText: "Phone",
                      prefixIcon: Icon(
                        Icons.phone_outlined,
                      )),
                ),
                const SizedBox(
                  height: 15.0,
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
                  title: 'Create an Account ',
                  onPressed: () async {
                   {
                  bool isVaildated = signUpVaildation(email.text, password.text, name.text, phone.text);
                  if (isVaildated) {
                   
                    bool isLogined = await FirebaseAuthHelper.instance
                        .signUp(email.text, password.text, context);
                    if (isLogined) {
                      Routes.instance.pushAndRemoveUntil(
                          widget: const Home(), context: context);
                    }
                  } 
                }
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Center(child: Text("Already  have an account?")),
                const SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
