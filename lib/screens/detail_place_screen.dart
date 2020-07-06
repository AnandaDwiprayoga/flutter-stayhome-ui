import 'package:flutter/material.dart';
import 'package:submission_pemula/styles/text_style.dart';

// ignore: must_be_immutable
class DetailPlaceScreen extends StatelessWidget {
  var _item;

  DetailPlaceScreen(var item) {
    _item = item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: _item['name'],
                  child: Material(
                    //to avoid error hero animation with text
                    type: MaterialType.transparency,
                    child: Text(
                      _item['name'],
                      style: MyTextStyle.textHeadingApp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: _item['photos'].map<Widget>((photo) {
                    return Container(
                      width: 270,
                      margin: EdgeInsets.all(12),
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 6),
                              color: Colors.grey.withOpacity(0.7),
                              blurRadius: 8,
                            ),
                          ]),
                      child: Hero(
                        tag: photo,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/gambar/shimmer.gif',
                            image: photo,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'About place',
                style: MyTextStyle.textLightApp,
              ),
              Text(
                _item['desc'],
                style: MyTextStyle.textRegularApp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
