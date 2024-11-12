import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';

class LinksArea extends StatefulWidget {
  const LinksArea({super.key});

  @override
  State<LinksArea> createState() => _LinksAreaState();
}

List<String> collections = [
  "New In",
  "Long Dress",
  "Short Dress",
  "Two Piece",
  "Playsuit",
  "Bags",
  "Sales",
  "All collections"
];

List customerServices = [
  "About Us",
  "Blog",
  "Contact",
  "FAQ'S",
  "Return Policy",
  "Shipping Info",
  "Size Guide",
  "Terms & Conditions"
];

class _LinksAreaState extends State<LinksArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
      child: Responsive.isMobile(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                ExpansionTile(
                  dense: false,
                  title: const Text(
                    'Get In Touch with us',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: AppColors.lightGray,
                  onExpansionChanged: (bool expanding) {
                    setState(() {});
                  },
                  trailing: const Icon(Icons.add),
                  children: const [
                    ListTile(
                        title: Text(
                            'Unique wears is an online and in-store leading fashion boutique with an array of carefully curated apparel and accessories to amplify your personal style.')),
                    ListTile(
                        title: Text(
                            'Contact Centre Support: +234 806 603 0254 | +234 703 326 7307')),
                    ListTile(title: Text('Email : beuniqueglobal@gmail.com')),
                  ], // Use the state list to determine the icon
                ),
                ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  expandedAlignment: Alignment.centerLeft,
                  title: const Text(
                    'Collection',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: AppColors.lightGray, // Use th
                  onExpansionChanged: (bool expanding) {
                    setState(() {});
                  },
                  trailing: const Icon(Icons.add),
                  children: List.generate(collections.length, (index) {
                    return (index != collections.length - 1)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(collections[index]),
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Text(collections[index]),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                  }), // Use the state list to determine the icon
                ),
                ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  expandedAlignment: Alignment.centerLeft,
                  backgroundColor: AppColors.lightGray,
                  title: const Text(
                    'Customer Services',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onExpansionChanged: (bool expanding) {
                    setState(() {});
                  },
                  trailing: const Icon(Icons.add),
                  children: List.generate(customerServices.length, (index) {
                    return (index != customerServices.length - 1)
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: Text(customerServices[index]),
                          )
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Text(customerServices[index]),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          );
                  }), // Use the the state list to determine the icon
                ),
                ExpansionTile(
                  title: const Text(
                    'Get 10% off When You Become a VIP',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: AppColors.lightGray,
                  onExpansionChanged: (bool expanding) {
                    setState(() {});
                  },
                  trailing: const Icon(Icons.add),
                  children: [
                    const ListTile(
                        title: Text(
                            "Scared of missing out? We'll send you a mail whenever any offer or new stock is available")),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration:
                                  InputDecoration(hintText: "Your Email"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 48,
                            decoration: UtilityClass.setButtonOutlineDecoration(
                                AppColors.inactiveColor!),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Icon(
                                  Icons.arrow_right_alt,
                                  size: 20,
                                  color: Colors.black,
                                )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            )
          : Padding(
              padding: UtilityClass.horizontalAndVerticalPadding,
              child: Responsive.isDesktop(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: UtilityClass.horizontalAndVerticalPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Get In Touch with us",
                                  style: FontClass.headerStyleMediumBlack,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                    'Unique wears is an online and in-store leading fashion boutique with an array of carefully curated apparel and accessories to amplify your personal style.'),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                    'Contact Centre Support: +234 806 603 0254 | +234 703 326 7307'),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Email : beuniqueglobal@gmail.com'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: UtilityClass.horizontalAndVerticalPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Collection",
                                  style: FontClass.headerStyleMediumBlack,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(collections.length,
                                      (index) {
                                    return (index != collections.length - 1)
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Text(collections[index]),
                                          )
                                        : Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Text(collections[index]),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          );
                                  }), // Use the
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: UtilityClass.horizontalAndVerticalPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Customer Services",
                                  style: FontClass.headerStyleMediumBlack,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                      customerServices.length, (index) {
                                    return (index !=
                                            customerServices.length - 1)
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child:
                                                Text(customerServices[index]),
                                          )
                                        : Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Text(
                                                    customerServices[index]),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              )
                                            ],
                                          );
                                  }), // Use the
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: UtilityClass.horizontalAndVerticalPadding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Get 10% off When You Become A VIP",
                                  style: FontClass.headerStyleMediumBlack,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                    "Scared of missing out? We'll send you a mail whenever any offer or new stock is available"),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            hintText: "Your Email"),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 48,
                                      decoration: UtilityClass
                                          .setButtonOutlineDecoration(
                                              AppColors.inactiveColor!),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Icon(
                                            Icons.arrow_right_alt,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    UtilityClass.horizontalAndVerticalPadding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Get In Touch with us",
                                      style:
                                          FontClass.headerStyleMediumBlack,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                        'Unique wears is an online and in-store leading fashion boutique with an array of carefully curated apparel and accessories to amplify your personal style.'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                        'Contact Centre Support: +234 806 603 0254 | +234 703 326 7307'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                        'Email : beuniqueglobal@gmail.com'),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    UtilityClass.horizontalAndVerticalPadding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Collection",
                                      style:
                                          FontClass.headerStyleMediumBlack,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: List.generate(
                                          collections.length, (index) {
                                        return (index != collections.length - 1)
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Text(collections[index]),
                                              )
                                            : Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    child: Text(
                                                        collections[index]),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  )
                                                ],
                                              );
                                      }), // Use the
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  UtilityClass.horizontalAndVerticalPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Customer Services",
                                    style: FontClass.headerStyleMediumBlack,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List.generate(
                                        customerServices.length, (index) {
                                      return (index !=
                                              customerServices.length - 1)
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child:
                                                  Text(customerServices[index]),
                                            )
                                          : Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10),
                                                  child: Text(
                                                      customerServices[index]),
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                )
                                              ],
                                            );
                                    }), // Use the
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  UtilityClass.horizontalAndVerticalPadding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Get 10% off When You Become A VIP",
                                    style: FontClass.headerStyleMediumBlack,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      "Scared of missing out? We'll send you a mail whenever any offer or new stock is available"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText: "Your Email"),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 48,
                                        decoration: UtilityClass
                                            .setButtonOutlineDecoration(
                                                AppColors.inactiveColor!),
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            child: const Icon(
                                              Icons.arrow_right_alt,
                                              color: Colors.black,
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
            ),
    );
  }
}
