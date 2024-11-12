import 'package:beunique_ecommerce/core/app_colors.dart';
import 'package:beunique_ecommerce/utils/font_class.dart';
import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: UtilityClass.horizontalPadding,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Text("Our History",
              style: FontClass.extraLargeHeaderStyleBlackNormal),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 100,
            child: Divider(
              thickness: 1,
              color: AppColors.borderGray,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Unique wears is dedicated to becoming a world-class fashion brand. Since its existence in the year 2018, we have been one of the best in delivering the season’s most wanted styles to millions of people worldwide.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Unique wears has been committed to growing the brand in the female fashion industry by providing the best quality clothing and accessories. Since our beginning in the year 2018, we’ve expanded from an online store to a Lagos store and then having a branch in Abuja, thereby making Beunique wears more accessible to everyone nationwide.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Our brand name has been featured in adverts, and our styles have been worn by your favorite celebrities. Unique wears has been able to work with some top influencer in Nigeria such as Papaya X, Phyna, Amaka, Dorathy, and so on. We sell collections of clothing, shoes, and bags for women. We are a pop culture phenomenon and have social media followings of over 500 thousand, including our loyal customers, celebrities, and brand influencers.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Unique wears is forever committed to producing the best quality clothing and, most importantly, satisfying our customers.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Text("Get in touch with us", style: FontClass.headerStyleMediumBlack),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Plot 5 Akiogun Rd, Maroko, Oniru, Victoria Island, Lagos, Nigeria',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Contact Centre Support: +234 806 603 0254',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Email: support@beuniquewears.com',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: UtilityClass.horizontalAndVerticalPadding,
            decoration: const BoxDecoration(color: Color(0xffEDEFFF)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text("WHO WE ARE", style: FontClass.headerStyleBlackNormal),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Unique wears is an online and in-store leading fashion boutique with an array of carefully curated apparel and accessories to amplify your personal style.',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  width: double.infinity,
                  child: Divider(
                    thickness: 1,
                    color: AppColors.borderGray,
                  ),
                ),
                Text("OUR VISION", style: FontClass.headerStyleBlackNormal),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'To innovate and enhance the best fashionable clothing, accessories and services to global customers. To make a difference through our branding to stay ahead of fashion trends, market changes, quality, and convenience.',
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 40),
                  width: double.infinity,
                  child: Divider(
                    thickness: 1,
                    color: AppColors.borderGray,
                  ),
                ),
                Text("OUR MISSION", style: FontClass.headerStyleBlackNormal),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Our mission is to create a world fashion company that can offer superior design, quality and value to our customers. We will accomplish this by being committed to offering great service and real value to our consumers around the world.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
