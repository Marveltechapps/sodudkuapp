import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sodakku/utils/constant.dart';

class GeneralPoliciesScreen extends StatelessWidget {
  const GeneralPoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whitecolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, size: 16),
        ),
        elevation: 0,
        title: Text("General Policies"),
      ),
      body: Column(
        spacing: 15,
        children: [
          ListTile(
            tileColor: whitecolor,
            leading: SvgPicture.asset(termssvg),
            title: Text(
              "Terms & Conditions",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded, color: greyColor),
            onTap: () {
              Navigator.pushNamed(context, '/termsAndConditions');
            },
          ),
          ListTile(
            tileColor: whitecolor,
            leading: SvgPicture.asset(privacysvg),
            title: Text(
              "Privacy Policy",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            trailing: Icon(Icons.arrow_forward_ios_rounded, color: greyColor),
            onTap: () {
              Navigator.pushNamed(context, '/privacyPolicy');
            },
          ),
        ],
      ),
    );
  }
}
