import 'package:flutter/material.dart';

class TodayMatches extends StatelessWidget {
  const TodayMatches({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 167,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(right: 10),
                width: 200,
                // padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.thaqfny.com/wp-content/uploads/2021/09/%D8%AB%D9%82%D9%81%D9%86%D9%8A-%D9%85%D8%A8%D8%A7%D8%B1%D8%A7%D8%A9-%D8%AA%D9%88%D8%AA%D9%86%D9%87%D8%A7%D9%85-%D9%88%D8%AA%D8%B4%D9%8A%D9%84%D8%B3%D9%8A.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
