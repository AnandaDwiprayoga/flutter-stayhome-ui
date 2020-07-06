import 'package:flutter/material.dart';
import 'package:submission_pemula/styles/text_style.dart';
import 'package:submission_pemula/listview/favorite_listview.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Favorite Place',
              style: MyTextStyle.textHeadingApp,
            ),
            Text(
              'Easy to find your favorite place',
              style: MyTextStyle.textLightApp,
            ),
            SizedBox(height: 24),
            Expanded(
              child: FavoriteListView(),
            ),
          ],
        ),
      ),
    );
  }
}
