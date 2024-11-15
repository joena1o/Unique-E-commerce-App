import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Container(color: Colors.grey[100]),
        errorWidget: (context, url, error) =>
            Container(color: Colors.redAccent));
  }
}
