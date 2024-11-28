import 'package:beunique_ecommerce/features/home_screen/provider/home_provider.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DrawerItems extends StatefulWidget {
  const DrawerItems({super.key, required this.callback});

  final Function callback;

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SafeArea(
          bottom: false,
          child: Center(
            child: GestureDetector(
              onTap: () {
                widget.callback();
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(Icons.close, size: 16),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            context.pop();
            context.go("/");
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("HOME"),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Divider(),
        ),
        GestureDetector(
          onTap: () {
            context.pop();
            context.go("/about");
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("ABOUT US"),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Divider(),
        ),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                List.generate(UtilityClass.uniqueCategories.length, (index) {
              final category = UtilityClass.uniqueCategories[index];
              return GestureDetector(
                onTap: () {
                  context.pop();
                  context.read<HomeProvider>().setCategoryValue(category);
                  context.go("/products", extra: true);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(category.toUpperCase()),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                      child: Divider(),
                    ),
                  ],
                ),
              );
            })),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text("CONTACT"),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Divider(),
        ),
        const Spacer(),
      ],
    );
  }
}
