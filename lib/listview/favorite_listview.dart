import 'package:flutter/material.dart';
import 'package:submission_pemula/data/my_building_data.dart';
import 'package:submission_pemula/styles/text_style.dart';
import 'package:submission_pemula/screens/detail_screen.dart';

class FavoriteListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
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
            width: double.infinity,
            height: 100,
            margin: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0.5),
                  blurRadius: 4,
                  color: Colors.grey.withOpacity(0.3),
                )
              ],
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/gambar/shimmer.gif',
                    image: MyBuildingData.apartments[index]['imageUrl'],
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
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
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
