import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/core/config/get_it_setup.dart';
import 'package:beunique_ecommerce/features/home_screen/presentation/widgets/product_grid_view.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/cart_provider.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/home_provider.dart';
import 'package:beunique_ecommerce/features/home_screen/provider/wishlist_provider.dart';
import 'package:beunique_ecommerce/features/product_screen/data/models/product_model.dart';
import 'package:beunique_ecommerce/features/product_screen/presentation/widgets/expanded_list_section.dart';
import 'package:beunique_ecommerce/features/wigdets/image_widget.dart';
import 'package:beunique_ecommerce/utils/dialog_services.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final FashionProduct product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String _selectedOption = 'Option 1';

  int quantity = 1;
  String size = "";

  @override
  Widget build(BuildContext context) {
    final singleProduct = widget.product;
    return Responsive.isMobile(context)
        ? Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: UtilityClass.horizontalAndVerticalPadding,
                alignment: Alignment.centerLeft,
                child: BreadCrumb(
                  items: <BreadCrumbItem>[
                    BreadCrumbItem(content: const Text('Home')),
                    BreadCrumbItem(content: const Text('Products')),
                    BreadCrumbItem(content: Text(singleProduct.productName)),
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
                child: ImageWidget(url: singleProduct.image),
              ),
              const SizedBox(height: 30),
              Container(
                width: Responsive.getSize(context).width,
                alignment: Alignment.centerLeft,
                padding: UtilityClass.horizontalPadding,
                child: Text(singleProduct.productName,
                    style: FontClass.headerStyleBlackNormal),
              ),
              Consumer<HomeProvider>(builder: (context, provider, child) {
                return Container(
                  width: Responsive.getSize(context).width,
                  alignment: Alignment.centerLeft,
                  padding: UtilityClass.horizontalPadding,
                  child: Text(
                      context
                          .read<HomeProvider>()
                          .calculateAmount(singleProduct.price),
                      style: FontClass.headerStyleBlack),
                );
              }),
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
                      FaIcon(
                        FontAwesomeIcons.fireFlameSimple,
                        size: 20,
                        color: Colors.red,
                      ),
                      SizedBox(width: 7),
                      Text(
                        "38 sold in last 6 hours",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
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
              Visibility(
                visible: singleProduct.sizes.isNotEmpty,
                child: Padding(
                    padding: UtilityClass.horizontalAndVerticalPadding,
                    child: Row(
                      children: [
                        Text(
                          "SIZE: ${size == "" ? " Not Selected" : size}",
                        )
                      ],
                    )),
              ),
              Padding(
                padding: UtilityClass.horizontalPadding,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                        List.generate(singleProduct.sizes.length, (sizeIndex) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            size = singleProduct.sizes[sizeIndex];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.borderGray, width: 1),
                            color: singleProduct.sizes[sizeIndex] == size
                                ? Colors.black
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Text(
                            singleProduct.sizes[sizeIndex],
                            style: TextStyle(
                              color: singleProduct.sizes[sizeIndex] == size
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    })),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: UtilityClass.horizontalAndVerticalPadding,
                child: Row(
                  children: [
                    Container(
                      height: 47,
                      width: 120,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.borderGray)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() => quantity++);
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.plus,
                              size: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(quantity.toString()),
                          const SizedBox(
                            width: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (quantity > 1) {
                                setState(() => quantity--);
                              }
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.minus,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 47,
                        decoration: UtilityClass.setButtonDecoration(
                            AppColors.darkColor),
                        child: ElevatedButton(
                            onPressed: () {
                              if (singleProduct.sizes.isNotEmpty &&
                                  size == "") {
                                return getIt<DialogServices>().showMessageError(
                                    "Please select your preferred size");
                              }
                              context.read<CartProvider>().addProduct(
                                  singleProduct,
                                  size: size,
                                  quantity: quantity);
                              setState(() {
                                size = "";
                              });
                            },
                            child: Text(
                              "ADD TO CART",
                              overflow: TextOverflow.ellipsis,
                              style: FontClass.buttonStyleWhiteNoSpacing,
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Consumer<WishlistProvider>(
                        builder: (context, provider, child) {
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<WishlistProvider>()
                              .addWishList(singleProduct);
                        },
                        child: Container(
                            height: 47,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.borderGray)),
                            child: Icon(
                              provider.wishList.any((e) =>
                                      singleProduct.productName ==
                                      e.productName)
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              size: 20,
                            )),
                      );
                    })
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
                height: 46,
                margin: UtilityClass.horizontalPadding,
                width: Responsive.getSize(context).width,
                decoration: UtilityClass.buttonDecorationOnlyOutline,
                child: ElevatedButton(
                    onPressed: () {},
                    child:
                        Text("BUY IT NOW", style: FontClass.buttonStyleBlack)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: UtilityClass.horizontalPadding,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.question_mark_rounded,
                            size: 19,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("Ask a question",
                              style: FontClass.navFontBlackNoSpace)
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.drive_eta_rounded,
                              size: 19,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Delivery & Returns",
                                style: FontClass.navFontBlackNoSpace)
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.share,
                              size: 19,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Share", style: FontClass.navFontBlackNoSpace)
                          ],
                        )),
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
                style: FontClass.titleStyleBlack,
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
          )
        : Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context)
                    ? Responsive.getSize(context).width * .07
                    : 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: UtilityClass.horizontalAndVerticalPadding,
                  alignment: Alignment.centerLeft,
                  child: BreadCrumb(
                    items: <BreadCrumbItem>[
                      BreadCrumbItem(content: const Text('Home')),
                      BreadCrumbItem(content: const Text('Products')),
                      BreadCrumbItem(content: Text(singleProduct.productName)),
                    ],
                    divider: Icon(
                      Icons.chevron_right,
                      color: AppColors.borderGray,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 600,
                        margin: UtilityClass.horizontalPadding,
                        decoration: const BoxDecoration(color: Colors.grey),
                        child: ImageWidget(url: singleProduct.image),
                      ),
                    ),
                    SizedBox(
                      width: Responsive.isDesktop(context) ? 40 : 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            width: Responsive.getSize(context).width,
                            alignment: Alignment.centerLeft,
                            padding: UtilityClass.horizontalPadding,
                            child: Text(singleProduct.productName,
                                style: FontClass.headerStyleBlackNormal),
                          ),
                          Consumer<HomeProvider>(
                              builder: (context, provider, child) {
                            return Container(
                              width: Responsive.getSize(context).width,
                              alignment: Alignment.centerLeft,
                              padding: UtilityClass.horizontalPadding,
                              child: Text(
                                  context
                                      .read<HomeProvider>()
                                      .calculateAmount(singleProduct.price),
                                  style: FontClass.headerStyleBlack),
                            );
                          }),
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
                              padding:
                                  UtilityClass.horizontalAndVerticalPadding,
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
                                  FaIcon(
                                    FontAwesomeIcons.fireFlameSimple,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    "38 sold in last 6 hours",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            visible: singleProduct.sizes.isNotEmpty,
                            child: Padding(
                                padding:
                                    UtilityClass.horizontalAndVerticalPadding,
                                child: Row(
                                  children: [
                                    Text(
                                      "SIZE: ${size == "" ? " Not Selected" : size}",
                                    )
                                  ],
                                )),
                          ),
                          Padding(
                            padding: UtilityClass.horizontalPadding,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                  singleProduct.sizes.length, (sizeIndex) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      size = singleProduct.sizes[sizeIndex];
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 10),
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.borderGray,
                                          width: 1),
                                      color:
                                          singleProduct.sizes[sizeIndex] == size
                                              ? Colors.black
                                              : Colors.transparent,
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Text(
                                      singleProduct.sizes[sizeIndex],
                                      style: TextStyle(
                                        color: singleProduct.sizes[sizeIndex] ==
                                                size
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: UtilityClass.horizontalAndVerticalPadding,
                            child: Row(
                              children: [
                                Container(
                                  height: 47,
                                  width: 120,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.borderGray)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() => quantity++);
                                        },
                                        child: const FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(quantity.toString()),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (quantity > 1) {
                                            setState(() => quantity--);
                                          }
                                        },
                                        child: const FaIcon(
                                          FontAwesomeIcons.minus,
                                          size: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 47,
                                    padding: const EdgeInsets.all(5),
                                    margin: UtilityClass.horizontalPadding,
                                    decoration:
                                        UtilityClass.setButtonDecoration(
                                            AppColors.darkColor),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (singleProduct.sizes.isNotEmpty &&
                                              size == "") {
                                            return getIt<DialogServices>()
                                                .showMessageError(
                                                    "Please select your preferred size");
                                          }
                                          context
                                              .read<CartProvider>()
                                              .addProduct(singleProduct,
                                                  size: size,
                                                  quantity: quantity);
                                          setState(() {
                                            size = "";
                                          });
                                        },
                                        child: Text(
                                          "ADD TO CART",
                                          overflow: TextOverflow.ellipsis,
                                          style: FontClass.buttonStyleWhite,
                                        )),
                                  ),
                                ),
                                Consumer<WishlistProvider>(
                                    builder: (context, provider, child) {
                                  return GestureDetector(
                                      onTap: () {
                                        context
                                            .read<WishlistProvider>()
                                            .addWishList(singleProduct);
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15, horizontal: 20),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.borderGray)),
                                          child: Icon(
                                            provider.wishList.any((e) =>
                                                    singleProduct.productName ==
                                                    e.productName)
                                                ? Icons.favorite
                                                : Icons.favorite_outline,
                                            size: 20,
                                          )));
                                })
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                                const Text(
                                    "I agree to the terms and conditions")
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
                            decoration:
                                UtilityClass.buttonDecorationOnlyOutline,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text("BUY IT NOW",
                                    style: FontClass.buttonStyleBlack)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: UtilityClass.horizontalPadding,
                            child: Wrap(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.question_mark_rounded,
                                        size: 19,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text("Ask a question",
                                          style: FontClass.navFontBlackNoSpace)
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.drive_eta_rounded,
                                          size: 19,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text("Delivery & Returns",
                                            style:
                                                FontClass.navFontBlackNoSpace)
                                      ],
                                    )),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.share,
                                          size: 19,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text("Share",
                                            style:
                                                FontClass.navFontBlackNoSpace)
                                      ],
                                    )),
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
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
