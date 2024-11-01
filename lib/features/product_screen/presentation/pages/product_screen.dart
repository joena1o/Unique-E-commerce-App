import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/features/home_screen/widgets/product_grid_view.dart';
import 'package:beunique_ecommerce/features/product_screen/presentation/widgets/expanded_list_section.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.productId});

  final String productId;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String _selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: UtilityClass.horizontalAndVerticalPadding,
          alignment: Alignment.centerLeft,
          child: BreadCrumb(
            items: <BreadCrumbItem>[
              BreadCrumbItem(content: const Text('Home')),
              BreadCrumbItem(content: const Text('Products')),
            ],
            divider: Icon(
              Icons.chevron_right,
              color: AppColors.borderGray,
            ),
          ),
        ),
        Container(
          height: 600,
          margin: UtilityClass.horizontalPadding,
          width: Responsive.getSize(context).width,
          decoration: const BoxDecoration(color: Colors.grey),
        ),
        const SizedBox(height: 30),
        Container(
          width: Responsive.getSize(context).width,
          alignment: Alignment.centerLeft,
          padding: UtilityClass.horizontalPadding,
          child: Text("Products", style: UtilityClass.headerStyleBlackNormal),
        ),
        Container(
          width: Responsive.getSize(context).width,
          alignment: Alignment.centerLeft,
          padding: UtilityClass.horizontalPadding,
          child: Text("N15,000", style: UtilityClass.headerStyleBlack),
        ),
        Container(
          width: Responsive.getSize(context).width,
          alignment: Alignment.centerLeft,
          padding: UtilityClass.horizontalAndVerticalPadding,
          child: const Text("By Beuniqueglobal"),
        ),
        Padding(
          padding: UtilityClass.horizontalPadding,
          child: const Divider(),
        ),
        Padding(
            padding: UtilityClass.horizontalAndVerticalPadding,
            child: const Row(
              children: [
                Icon(
                  Icons.check_circle_outline_outlined,
                  size: 20,
                  color: Colors.green,
                ),
                SizedBox(width: 7),
                Text(
                  "In Stock",
                  style: TextStyle(color: Colors.green),
                )
              ],
            )),
        Padding(
            padding: UtilityClass.horizontalPadding,
            child: const Row(
              children: [
                Icon(
                  Icons.fire_extinguisher,
                  size: 20,
                  color: Colors.red,
                ),
                SizedBox(width: 7),
                Text(
                  "38 sold in last 6 hours",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: UtilityClass.horizontalPadding,
            child: const Row(
              children: [
                Icon(
                  Icons.remove_red_eye_outlined,
                  size: 20,
                ),
                SizedBox(width: 7),
                Text(
                  "40 people are viewing this right now",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        Padding(
            padding: UtilityClass.horizontalAndVerticalPadding,
            child: const Row(
              children: [
                Text(
                  "SIZE: MEDIUM",
                )
              ],
            )),
        Padding(
          padding: UtilityClass.horizontalPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10),
                decoration: UtilityClass.setButtonOutlineDecoration(
                    AppColors.borderGray),
                child: const Text("X-Large"),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10),
                decoration: UtilityClass.setButtonOutlineDecoration(
                    AppColors.borderGray),
                child: const Text("Large"),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10),
                decoration: UtilityClass.setButtonOutlineDecoration(
                    AppColors.borderGray),
                child: const Text("Medium"),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(right: 10),
                decoration: UtilityClass.setButtonOutlineDecoration(
                    AppColors.borderGray),
                child: const Text("Small"),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: UtilityClass.horizontalAndVerticalPadding,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderGray)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.add,
                        size: 16,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("1"),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.exposure_minus_1_sharp,
                        size: 16,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  margin: UtilityClass.horizontalPadding,
                  decoration:
                      UtilityClass.setButtonDecoration(AppColors.darkColor),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "ADD TO CART",
                        style: UtilityClass.buttonStyleWhite,
                      )),
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderGray)),
                  child: const Icon(
                    Icons.favorite_outline,
                    size: 20,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Radio(
                value: 'Option 2',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value!;
                  });
                },
              ),
              const Text("I agree to the terms and conditions")
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: UtilityClass.horizontalPadding,
          width: Responsive.getSize(context).width,
          decoration: UtilityClass.buttonDecorationOnlyOutline,
          child: ElevatedButton(
              onPressed: () {},
              child: Text("BUY IT NOW", style: UtilityClass.buttonStyleBlack)),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: UtilityClass.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.question_mark_rounded,
                    size: 19,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("Ask a question",
                      style: UtilityClass.navFontBlackNoSpace)
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.drive_eta_rounded,
                    size: 19,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("Delivery & Returns",
                      style: UtilityClass.navFontBlackNoSpace)
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.share,
                    size: 19,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("Share", style: UtilityClass.navFontBlackNoSpace)
                ],
              ),
              const SizedBox(
                width: 50,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: UtilityClass.horizontalPadding,
          child: const Divider(),
        ),
        Container(
          padding: UtilityClass.horizontalAndVerticalPadding,
          child: Row(
            children: [
              const Icon(Icons.drive_eta_rounded),
              VerticalDivider(
                color: AppColors.inactiveColor,
                thickness: 2,
              ),
              const Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Order in the next 9 hours 50 minutes to get it between"),
                  Text("Monday, Nov 4 and Friday, Nov 8")
                ],
              ))
            ],
          ),
        ),
        Padding(
          padding: UtilityClass.horizontalPadding,
          child: const Divider(),
        ),
        const SizedBox(
          height: 30,
        ),
        const ExpandedListSection(),
        const SizedBox(
          height: 60,
        ),
        Text(
          "You may also like",
          style: UtilityClass.titleStyleBlack,
        ),
        const SizedBox(
          height: 5,
        ),
        const SizedBox(
          width: 100,
          child: Divider(
            thickness: 1.5,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const ProductGridView()
      ],
    );
  }
}
