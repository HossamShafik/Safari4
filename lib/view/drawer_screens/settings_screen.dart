import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Color deepPurple = Colors.deepPurpleAccent;
  Color pink = Colors.pink[600];
  Color blue = Colors.indigo;
  Color black = Colors.black;
  Color grey = Colors.grey[900];
  Color red = Colors.redAccent;
  Color grey2 = Colors.grey[50];
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
              color: black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30, right: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Language',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                Icons.language,
              ),
            ),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                FontAwesomeIcons.solidUserCircle,
              ),
            ),
            ListTile(
              title: Text(
                'Privacy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(Icons.privacy_tip),
            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(Icons.help),
            ),
            ListTile(
              title: Text(
                'Share',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(Icons.share),
            ),
            ListTile(
              title: Text(
                'Dark Mode',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Switch(
                activeTrackColor: blue.withOpacity(0.5),
                activeColor: blue,
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 15),
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
