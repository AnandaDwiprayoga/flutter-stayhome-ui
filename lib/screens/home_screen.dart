import 'package:flutter/material.dart';
import 'package:submission_pemula/styles/text_style.dart';
import 'package:submission_pemula/data/my_icon_data.dart';
import 'package:submission_pemula/listview/top_listview.dart';
import 'package:submission_pemula/listview/bottom_listview.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreemState createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreen> {
  int _selectedIcon = 0;

  Widget _buildButtonMenu(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIcon = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _selectedIcon == index ? Colors.black87 : Colors.black12,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                MyIconData.icons[index],
                color: _selectedIcon == index ? Colors.black87 : Colors.black12,
              ),
              onPressed: () {},
            ),
            Text(
              MyIconData.titleIcon[index],
              style: TextStyle(
                fontFamily: 'Poppins',
                color: _selectedIcon == index ? Colors.black87 : Colors.black12,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Text(
                'Discover',
                style: MyTextStyle.textHeadingApp,
              ),
            ),
            Text(
              'Find the great moments',
              style: MyTextStyle.textLightApp,
            ),
            SizedBox(height: 24),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List<Widget>.generate(
                  MyIconData.titleIcon.length,
                  (index) => _buildButtonMenu(index),
                ).toList(),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Newest places',
              style: MyTextStyle.textLightApp,
            ),
            ListViewTop(),
            SizedBox(height: 24),
            Text(
              'Cities you love',
              style: MyTextStyle.textLightApp,
            ),
            BottomListView(),
          ],
        ),
      ),
    );
  }
}
