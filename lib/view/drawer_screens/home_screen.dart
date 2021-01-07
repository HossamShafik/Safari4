import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/models/Provider_Offset.dart';
import 'package:project/view/hotel_stream_screen.dart';
import 'package:project/view/services_tabs_screens/service_screen.dart';
import 'package:project/view/tour_stream_screen.dart';
import 'package:provider/provider.dart';
import '../car_stream_screen.dart';
import 'profile_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Map> categories = [
    {'name': 'Hotels', 'icon': FontAwesomeIcons.hotel},
    {'name': 'Tours', 'icon': FontAwesomeIcons.snowboarding},
    {'name': 'Cars', 'icon': Icons.directions_car_rounded}
  ];

  Color deepPurple = Colors.deepPurpleAccent;
  Color pink = Colors.pink[600];
  Color blue = Colors.indigo;
  Color black = Colors.black;
  Color grey = Colors.grey[900];

  //check page is diplay
  int selectedButtonIndex=1;
  int checkIndex = 1;

  @override
  Widget build(BuildContext context) {
    var providerType = Provider.of<ProviderOffset>(context);

    return Container(
      child: AnimatedContainer(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          transform: Matrix4.translationValues(providerType.xOffset, providerType.yOffset, 0)
            ..scale(providerType.scaleFactor),
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(providerType.isDrawerOpen ? 20 : 0.0)),
          child: InkWell(
            onTap: (){
              {
                if(providerType.isDrawerOpen){
                  providerType.drawerClose();
                }
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          providerType.isDrawerOpen
                              ? IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    size: 35,
                                    color: blue,
                                  ),
                                  onPressed: () {
                                    providerType.drawerClose();
                                  },
                                )
                              : IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    size: 25,
                                    color: blue,
                                  ),
                                  onPressed: () {
                                    providerType.drawerOpen();
                                  }),
                          InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProfileScreen();
                              }));
                            },
                            child: CircleAvatar(
                              radius: 27,
                              backgroundColor: blue,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/pro.jpg'),
                                  radius: 23,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Head(),
                          Body(),
                          swipeScreen(checkIndex),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  Widget Head() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Android' + '!',
                style: TextStyle(
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Find Your Service',
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w500,
                  color: pink,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Body() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                if(checkIndex==1){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesScreen(selectedIndex: 0,)));
                }else if(checkIndex==2){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesScreen(selectedIndex: 1,)));
                }
                else if(checkIndex==3){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesScreen(selectedIndex: 2,)));
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text('Search',style: TextStyle(color: Colors.grey[500],),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey[50],
                      child: Icon(Icons.search,color: blue,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20,
            ),
            child: Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
          ),
          Container(
            height: 110,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15, right: 28,left: 2),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        checkIndex = index + 1;
                        selectedButtonIndex=checkIndex;
                      });
                    },
                    child: Container(
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: selectedButtonIndex==index+1?deepPurple:Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categories[index]['icon'],
                            color: selectedButtonIndex==index+1?Colors.white:deepPurple,
                            size: index==0?30:35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              categories[index]['name'],
                              style: TextStyle(
                                color: selectedButtonIndex==index+1?Colors.white:black,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Popular',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if(checkIndex==1){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesScreen(selectedIndex: 0,)));
                      }else if(checkIndex==2){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesScreen(selectedIndex: 1,)));
                      }
                      else if(checkIndex==3){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesScreen(selectedIndex: 2,)));
                      }
                    });
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(color: deepPurple),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget swipeScreen(int index) {
    if (index == 1) {
      return HotelStream();
    } else if (index == 2) {
      return TourStream();
    } else if (index == 3) {
      return CarStream();
    }
  }


}

