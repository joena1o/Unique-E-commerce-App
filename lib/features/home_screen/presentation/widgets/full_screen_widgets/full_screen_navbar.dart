import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FullScreenNavbar extends StatefulWidget {
  const FullScreenNavbar({super.key});

  @override
  State<FullScreenNavbar> createState() => _FullScreenNavbarState();
}

class _FullScreenNavbarState extends State<FullScreenNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.borderGray)),
          color: Colors.white),
      width: Responsive.getSize(context).width,
      child: Padding(
        padding: UtilityClass.horizontalPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("UNIQUE", style: UtilityClass.headerStyleBlack),
            Expanded(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "HOME",
                      style: UtilityClass.navFontBlack,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.go("/about");
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        "ABOUT US",
                        style: UtilityClass.navFontBlack,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "JUMPSUITS",
                      style: UtilityClass.navFontBlack,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "PLAYSUIT",
                      style: UtilityClass.navFontBlack,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "TWO PIECE",
                      style: UtilityClass.navFontBlack,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    child: Text(
                      "SHORT DRESS",
                      style: UtilityClass.navFontBlack,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "LONG DRESS",
                      style: UtilityClass.navFontBlack,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "NEW IN",
                      style: UtilityClass.navFontBlack,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "BAGS",
                      style: UtilityClass.navFontBlack,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "SALES",
                      style: UtilityClass.navFontBlack,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      "CONTACT",
                      style: UtilityClass.navFontBlack,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.person_outline)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined))
          ],
        ),
      ),
    );
  }
}
