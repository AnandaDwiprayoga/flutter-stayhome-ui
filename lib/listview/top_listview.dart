import 'package:flutter/material.dart';
import 'package:submission_pemula/data/my_building_data.dart';
import 'package:submission_pemula/styles/text_style.dart';
import 'package:submission_pemula/screens/detail_screen.dart';

class ListViewTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            List<Widget>.generate(MyBuildingData.apartments.length, (index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(MyBuildingData.apartments[index]),
              ),
            ),
            child: Container(
              margin: index == 0
                  ? EdgeInsets.fromLTRB(4, 12, 12, 12)
                  : index == MyBuildingData.apartments.length - 1
                      ? EdgeInsets.fromLTRB(12, 12, 12, 4)
                      : EdgeInsets.all(12),
              width: 250,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0.5),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: MyBuildingData.apartments[index]['imageUrl'],
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/gambar/shimmer.gif',
                        image: MyBuildingData.apartments[index]['imageUrl'],
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: MyBuildingData.apartments[index]['name'],
                          //to avoid error hero animation with text
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(
                              MyBuildingData.apartments[index]['name'],
                              style: MyTextStyle.textHedingItem,
                            ),
                          ),
                        ),
                        Text(
                          '\$ ${MyBuildingData.apartments[index]['price']}/night • ${MyBuildingData.apartments[index]['guest']} Guests',
                          style: MyTextStyle.textLightItem,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
