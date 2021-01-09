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

  String languageType;

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
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DropdownButton<String>(
                underline: Container(),
                iconEnabledColor: blue,
                iconDisabledColor: blue,
                isExpanded: true,
                value: languageType,
                icon: Icon(FontAwesomeIcons.chevronDown),
                iconSize: 16,
                hint: Text('English',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.grey[900],),),
                style: TextStyle(color: Colors.grey[900],fontSize: 20, fontWeight: FontWeight.w400),
                onChanged: (String newValue) {
                  setState(() {
                    languageType = newValue;
                  });
                },
                items: <String>['English', 'Arabic','French']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(
                FontAwesomeIcons.solidUserCircle,color: blue,
              ),
            ),
            ListTile(
              title: Text(
                'Privacy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(Icons.privacy_tip,color: blue,),
            ),
            ListTile(
              title: Text(
                'About',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(Icons.help,color: blue,),
            ),
            ListTile(
              title: Text(
                'Share',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              trailing: Icon(Icons.share,color: blue,),
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
              padding: const EdgeInsets.only(top: 70),
              child: InkWell(
                onTap: (){

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Logout',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.red),
                    ),
                    SizedBox(width: 5,),
                    Icon(Icons.logout,color: Colors.red,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
