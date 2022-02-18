import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kora/Utils/colors.dart';

class TodayMatches extends StatelessWidget {
  const TodayMatches({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(10),
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 0.8,
            mainAxisSpacing: 15,
            crossAxisSpacing: 12,
            // mainAxisExtent: 80
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: "https://www.thaqfny.com/wp-content/uploads/2021/09/%D8%AB%D9%82%D9%81%D9%86%D9%8A-%D9%85%D8%A8%D8%A7%D8%B1%D8%A7%D8%A9-%D8%AA%D9%88%D8%AA%D9%86%D9%87%D8%A7%D9%85-%D9%88%D8%AA%D8%B4%D9%8A%D9%84%D8%B3%D9%8A.jpg",
                imageBuilder: (context, imageProvider) => Container(

                  width: 200,
                  // padding: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill
                      )
                  ),

                ),
                placeholder: (context, url) => Container(
                  margin: EdgeInsets.only(right: 10),
                  width: 200,
                  // padding: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: greyPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: CircularProgressIndicator(),),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            );
          }),
    );
  }
}
