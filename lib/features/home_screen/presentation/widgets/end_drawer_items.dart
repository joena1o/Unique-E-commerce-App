import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/cart_provider.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/home_provider.dart';
import 'package:beunique_ecommerce/features/product_screen/data/models/cart_model.dart';
import 'package:beunique_ecommerce/features/wigdets/image_widget.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EndDrawerItems extends StatefulWidget {
  const EndDrawerItems({super.key, required this.callback});

  final Function callback;

  @override
  State<EndDrawerItems> createState() => _EndDrawerItemsState();
}

class _EndDrawerItemsState extends State<EndDrawerItems> {
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, provider, child) {
      return Column(
        children: [
          SafeArea(
            bottom: false,
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
              child: Text("Shopping Cart (${provider.totalItems})"),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            //child: const Text("Congratulations, you have free shipping!"),
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: provider.items.length,
                  itemBuilder: (BuildContext ctx, int i) {
                    return cartItem(provider.items[i]);
                  })),
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            decoration: BoxDecoration(color: AppColors.lightColor, boxShadow: [
              BoxShadow(
                  color: AppColors.borderGray, blurRadius: 2, spreadRadius: 1)
            ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.borderGray,
                          child: const Icon(Icons.edit),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Add Note")
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.borderGray,
                          child: const Icon(Icons.percent),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Coupon")
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.borderGray,
                          child: const Icon(Icons.local_shipping_outlined),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Shipping")
                      ],
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Subtotal:"),
                      Text(context.read<HomeProvider>().calculateAmount(
                          context.read<CartProvider>().totalPrice))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                  child: Text("Taxes and shipping calculated at checkout"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      const Expanded(
                          child: Text("I agree to the terms and conditions"))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          height: 46,
                          decoration: UtilityClass.setButtonDecoration(
                              _selectedOption.isNotEmpty
                                  ? AppColors.darkColor
                                  : AppColors.inactiveColor!),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "CHECK OUT",
                                overflow: TextOverflow.ellipsis,
                                style: FontClass.buttonStyleWhiteNoSpacing,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }

  Widget cartItem(CartItem cartItem) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 80,
              decoration: BoxDecoration(
                color: AppColors.inactiveColor,
              ),
              child: ImageWidget(url: cartItem.product.image),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cartItem.product.productName),
                Visibility(
                    visible: cartItem.size!.isNotEmpty,
                    child: Text("Size: ${cartItem.size}")),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(context
                      .read<HomeProvider>()
                      .calculateAmount(cartItem.product.price)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      height: 42,
                      width: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderGray)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.plus,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(cartItem.quantity.toString()),
                          const SizedBox(
                            width: 15,
                          ),
                          const FaIcon(
                            FontAwesomeIcons.minus,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          context.read<CartProvider>().removeProduct(
                              cartItem.product,
                              quantity: cartItem.quantity,
                              size: cartItem.size);
                        },
                        child: const Text(
                          "Remove",
                          style: TextStyle(fontSize: 14),
                        )),
                  ],
                ),
              ],
            ))
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0),
          child: Divider(),
        ),
      ],
    );
  }
}
