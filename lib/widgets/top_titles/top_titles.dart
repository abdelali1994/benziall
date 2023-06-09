// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toptitles extends StatelessWidget {
  final String title, subtitle;
  const Toptitles({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: kTextTabBarHeight + 12,
        ),
        if (title == "Login" || title == "Create Account")
          //  const BackButton(),

          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
        const SizedBox(
          height: 12,
        ),
        Text(title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 12,
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
