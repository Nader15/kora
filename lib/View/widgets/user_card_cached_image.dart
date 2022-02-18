import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserCardCachedImage extends StatelessWidget {
  UserCardCachedImage({Key key, this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Container(
        height:
        MediaQuery.of(context).size.height / 5,
        width:
        MediaQuery.of(context).size.width / 3.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
