import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MobileNavbar extends StatefulWidget {
  const MobileNavbar(
      {super.key,
      required this.openDrawer,
      required this.openEndDrawer,
      required this.openSearch});

  final Function openDrawer;
  final Function openEndDrawer;
  final Function openSearch;

  @override
  State<MobileNavbar> createState() => _MobileNavbarState();
}

class _MobileNavbarState extends State<MobileNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.borderGray)),
          color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                widget.openDrawer();
              },
              icon: const Icon(Icons.menu)),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                widget.openSearch();
              },
              icon: const Icon(Icons.search)),
          const Spacer(),
          Text("UNIQUE", style: FontClass.headerStyleBlack),
          const Spacer(),
          IconButton(
              onPressed: () {
                context.go('/wishlist');
              },
              icon: const Icon(Icons.favorite_outline)),
          IconButton(
              onPressed: () {
                widget.openEndDrawer();
              },
              icon: const Icon(Icons.shopping_bag_outlined))
        ],
      ),
    );
  }
}
