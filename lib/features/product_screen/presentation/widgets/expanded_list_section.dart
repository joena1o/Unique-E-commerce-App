import 'package:beunique_ecommerce/utils/utility_class.dart';
import 'package:flutter/material.dart';

class ExpandedListSection extends StatefulWidget {
  const ExpandedListSection({super.key});

  @override
  State<ExpandedListSection> createState() => _ExpandedListSectionState();
}

class _ExpandedListSectionState extends State<ExpandedListSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: UtilityClass.horizontalAndVerticalPadding,
          decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
          child: ExpansionTile(
            title: const Text(
              'Review',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onExpansionChanged: (bool expanding) {
              setState(() {});
            },
            trailing: const Icon(Icons.add),
            children: const [],
          ),
        ),
        Container(
          margin: UtilityClass.horizontalPadding,
          decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
          child: ExpansionTile(
            title: const Text(
              'Shopping',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onExpansionChanged: (bool expanding) {
              setState(() {});
            },
            trailing: const Icon(Icons.add),
            children: const [
              ListTile(
                  title: Text(
                      'For orders placed before 7am CAT, we endeavour to process the same business day. Orders placed after 11am AEDT will be processed the next business day.')),
              ListTile(
                  title: Text(
                      'During sale events and new collection launches, there may be a slightly longer processing time.')),
              ListTile(
                  title: Text(
                      'All August orders are hand-picked and packed with love from Byron Bay, Australia.')),
            ],
          ),
        ),
        Container(
          margin: UtilityClass.horizontalAndVerticalPadding,
          decoration: const BoxDecoration(color: Color(0xfff5f5f5)),
          child: ExpansionTile(
            title: const Text(
              'Return',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            onExpansionChanged: (bool expanding) {
              setState(() {});
            },
            trailing: const Icon(Icons.add),
            children: [
              const ListTile(
                  title: Text(
                      'You can choose between a refund or a credit note on full priced items.')),
              Padding(
                padding: UtilityClass.horizontalAndVerticalPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bulletPoint(
                        'Item(s) must be returned in their original condition and packaging: unworn, unwashed and with all tags attached.'),
                    _bulletPoint(
                        'Earrings cannot be returned due to health and safety reasons'),
                    _bulletPoint(
                        'Return shipping methods and associated costs are the responsibility of the customer.'),
                    _bulletPoint(
                        "Sale items can not be refunded for change of mind.")
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bulletPoint(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 7.0),
            child: Icon(Icons.circle, size: 8, color: Colors.black),
          ), // Bullet point icon
          const SizedBox(width: 8), // Space between bullet and text
          Expanded(child: Text(text)), // The bullet point text
        ],
      ),
    );
  }
}
