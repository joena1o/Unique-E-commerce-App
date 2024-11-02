import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Responsive.isMobile(context)
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(
              horizontal: Responsive.getSize(context).width * .08),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 38.0),
            child: Text("Account"),
          ),
          Container(
            padding: UtilityClass.horizontalPadding,
            alignment: Alignment.centerLeft,
            child: const Text("Sign In"),
          ),
          Container(
            padding: UtilityClass.horizontalAndVerticalPadding,
            child: TextFormField(
              decoration: const InputDecoration(hintText: "Email*"),
            ),
          ),
          Container(
            padding: UtilityClass.horizontalPadding,
            child: TextFormField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                  hintText: "Password*"),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: UtilityClass.horizontalAndVerticalPadding,
            child: const Text("Lost your password?"),
          ),
          Container(
            width: Responsive.getSize(context).width,
            padding: const EdgeInsets.all(5),
            margin: UtilityClass.horizontalPadding,
            decoration: UtilityClass.setButtonDecoration(AppColors.darkColor),
            child:
                ElevatedButton(onPressed: () {}, child: const Text("SIGN IN")),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: UtilityClass.horizontalAndVerticalPadding,
            alignment: Alignment.centerLeft,
            child: const Text("New customer?"),
          ),
          Container(
            padding: UtilityClass.horizontalPadding,
            alignment: Alignment.centerLeft,
            child: const Text(
                "Sign up for early Sale access plus tailored new arrivals, trends and promotions. To opt out, click unsubscribe in our emails."),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(5),
              margin: UtilityClass.horizontalAndVerticalPadding,
              decoration: UtilityClass.setButtonDecoration(AppColors.darkColor),
              child: ElevatedButton(
                  onPressed: () {}, child: const Text("REGISTER")),
            ),
          ),
        ],
      ),
    );
  }
}
