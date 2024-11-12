import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';

class BottomBanner extends StatelessWidget {
  const BottomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(color: AppColors.faintDarkColor),
      width: Responsive.getSize(context).width,
      child: Responsive.isMobile(context)
          ? PageView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.map,
                      size: 60,
                      color: AppColors.lightColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Shopping Worldwide",
                      style: FontClass.buttonRegularStyleWhite,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.autorenew_rounded,
                      size: 60,
                      color: AppColors.lightColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "2 Days Return",
                      style: FontClass.buttonRegularStyleWhite,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shield_outlined,
                      size: 60,
                      color: AppColors.lightColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Security Payment",
                      style: FontClass.buttonRegularStyleWhite,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.support_agent,
                      size: 60,
                      color: AppColors.lightColor,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "24/7 Support",
                      style: FontClass.buttonRegularStyleWhite,
                    )
                  ],
                )
              ],
            )
          : Responsive.isTablet(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: UtilityClass.horizontalAndVerticalPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.map,
                                size: 60,
                                color: AppColors.lightColor,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Shopping Worldwide",
                                style: FontClass.buttonRegularStyleWhite,
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.autorenew_rounded,
                                size: 60,
                                color: AppColors.lightColor,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "2 Days Return",
                                style: FontClass.buttonRegularStyleWhite,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: UtilityClass.horizontalAndVerticalPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.shield_outlined,
                                size: 60,
                                color: AppColors.lightColor,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Security Payment",
                                style: FontClass.buttonRegularStyleWhite,
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.support_agent,
                                size: 60,
                                color: AppColors.lightColor,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "24/7 Support",
                                style: FontClass.buttonRegularStyleWhite,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map,
                          size: 60,
                          color: AppColors.lightColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Shopping Worldwide",
                          style: FontClass.buttonRegularStyleWhite,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.autorenew_rounded,
                          size: 60,
                          color: AppColors.lightColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "2 Days Return",
                          style: FontClass.buttonRegularStyleWhite,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shield_outlined,
                          size: 60,
                          color: AppColors.lightColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Security Payment",
                          style: FontClass.buttonRegularStyleWhite,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.support_agent,
                          size: 60,
                          color: AppColors.lightColor,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "24/7 Support",
                          style: FontClass.buttonRegularStyleWhite,
                        )
                      ],
                    )
                  ],
                ),
    );
  }
}
