import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:submission_pemula/styles/text_style.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'My Profile',
              style: MyTextStyle.textHeadingApp,
            ),
            SizedBox(height: 24),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 4,
                          color: Colors.grey.withOpacity(0.3),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/gambar/profile.jpg'),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Ananda Dwi Prayoga',
                    style: MyTextStyle.textHedingItem,
                  ),
                  Text(
                    'Hello, my name is ananda dwi prayoga, i\'m dicoding graduate academy',
                    style: MyTextStyle.textLightDesc,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.instagram,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'anandadp4',
                  style: MyTextStyle.textHedingItem,
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.github,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'AnandaDwiprayoga',
                  style: MyTextStyle.textHedingItem,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// 'Hello, my name is ananda dwi prayoga, i\'m dicoding graduate academy',
