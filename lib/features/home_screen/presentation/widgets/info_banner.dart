import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.borderGray,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: Responsive.isMobile(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.inactiveColor,
                size: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              Text("Contact Us", style: UtilityClass.infoLabelGray)
            ],
          ),
          VerticalDivider(
            color: AppColors.inactiveColor,
            thickness: 2,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(
                Icons.email_outlined,
                color: AppColors.inactiveColor,
                size: 18,
              ),
              const SizedBox(
                width: 5,
              ),
              Text("uniqueglobal@gmail.com", style: UtilityClass.infoLabelGray)
            ],
          )
        ],
      ),
    );
  }
}
