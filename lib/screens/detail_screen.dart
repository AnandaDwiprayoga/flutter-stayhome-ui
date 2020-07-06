import 'package:flutter/material.dart';
import 'package:submission_pemula/styles/text_style.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  var _item;

  DetailScreen(var item) {
    _item = item;
  }

  Widget _buildRatingStar(int rate) {
    String stars = '';
    for (int i = 0; i < rate; i++) {
      stars += '⭐ ';
    }
    return Text(stars.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                Center(
                  child: Text(
                    _item['location'],
                    style: MyTextStyle.textLightApp,
                  ),
                ),
                SizedBox(height: 26),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 6),
                          color: Colors.grey.withOpacity(0.7),
                          blurRadius: 15,
                        ),
                      ]),
                  child: Hero(
                    tag: _item['imageUrl'],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/gambar/shimmer.gif',
                        image: _item['imageUrl'],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
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
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Mansion',
                      style: MyTextStyle.textLightApp,
                    ),
                    _buildRatingStar(_item['rate']),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Price',
                      style: MyTextStyle.textLightApp,
                    ),
                    Text(
                      '\$${_item['price']}/night',
                      style: MyTextStyle.textRegularApp,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Max. People',
                      style: MyTextStyle.textLightApp,
                    ),
                    Text(
                      '${_item['guest']} Guests',
                      style: MyTextStyle.textRegularApp,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Check-In Time',
                      style: MyTextStyle.textLightApp,
                    ),
                    Text(
                      _item['checkIn'],
                      style: MyTextStyle.textRegularApp,
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Check-Out Time',
                      style: MyTextStyle.textLightApp,
                    ),
                    Text(
                      _item['checkOut'],
                      style: MyTextStyle.textRegularApp,
                    ),
                  ],
                ),
                SizedBox(height: 26),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  color: Color(0XFF6792FF),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Masih dalam proses pengemangan, nantikan ya",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        fontSize: 16.0);
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
