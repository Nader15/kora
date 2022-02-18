import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularCachedImagesWidget extends StatelessWidget {
  CircularCachedImagesWidget({Key key, this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
