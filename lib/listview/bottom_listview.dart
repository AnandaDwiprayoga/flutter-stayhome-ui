import 'package:flutter/material.dart';
import 'package:submission_pemula/data/my_building_data.dart';
import 'package:submission_pemula/styles/text_style.dart';
import 'package:submission_pemula/screens/detail_place_screen.dart';

class BottomListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List<Widget>.generate(MyBuildingData.cities.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      DetailPlaceScreen(MyBuildingData.cities[index]),
                ),
              );
            },
            child: Container(
              margin: index == 0
                  ? EdgeInsets.fromLTRB(4, 12, 12, 12)
                  : index == MyBuildingData.apartments.length - 1
                      ? EdgeInsets.fromLTRB(12, 12, 12, 4)
                      : EdgeInsets.all(12),
              width: 200,
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
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/gambar/shimmer.gif',
                        image: MyBuildingData.cities[index]['imageUrl'],
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Center(
                      child: Text(
                        MyBuildingData.cities[index]['name'],
                        style: MyTextStyle.textHedingItem,
                      ),
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
