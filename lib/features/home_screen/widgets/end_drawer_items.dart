import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';

class EndDrawerItems extends StatefulWidget {
  const EndDrawerItems({super.key, required this.callback});

  final Function callback;

  @override
  State<EndDrawerItems> createState() => _EndDrawerItemsState();
}

class _EndDrawerItemsState extends State<EndDrawerItems> {
  String _selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          bottom: false,
          child: Container(
            margin: const EdgeInsets.only(top: 40),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
            child: const Text("Shopping Cart (0)"),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: const Text("Congratulations, you have free shipping!"),
        ),
        Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                itemCount: 10,
                itemBuilder: (BuildContext ctx, int i) {
                  return cartItem();
                })),
        Container(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          decoration: BoxDecoration(color: AppColors.lightColor, boxShadow: [
            BoxShadow(
                color: AppColors.borderGray, blurRadius: 2, spreadRadius: 1)
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Subtotal:"), Text("N15,000")],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: Text("Taxes and shipping calculated at checkout"),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: UtilityClass.setButtonDecoration(
                            AppColors.inactiveColor!),
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "CHECK OUT",
                              style: UtilityClass.buttonStyleWhite,
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: UtilityClass.buttonDecorationOnlyOutline,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "VIEW CART",
                              style: UtilityClass.buttonStyleBlack,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget cartItem() {
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
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Sacki"),
                const Text("Size: Medium"),
                const Text("\$21.39"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.mode_edit_outlined,
                        size: 18,
                      )),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderGray)),
                      child: const Row(
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
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Remove",
                          style: TextStyle(fontSize: 14),
                        ))
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
