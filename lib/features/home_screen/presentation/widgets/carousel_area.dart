import 'package:beunique_ecommerce/utils/responsive.dart';
import 'package:flutter/material.dart';

class CarouselArea extends StatefulWidget {
  const CarouselArea({super.key});

  @override
  State<CarouselArea> createState() => _CarouselAreaState();
}

class _CarouselAreaState extends State<CarouselArea> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxWidth > 800 ? 750 : 250,
        width: Responsive.getSize(context).width,
        decoration: const BoxDecoration(color: Colors.grey),
      );
    });
  }
}
