import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;
import 'package:project/models/hotel.dart';
import 'package:project/models/hotel_filter_model.dart';
import 'package:project/view/services_tabs_screens/hotel_search_stream.dart';
import 'package:provider/provider.dart';

class HotelsService extends StatefulWidget {
  @override
  _HotelsServiceState createState() => _HotelsServiceState();
}

class _HotelsServiceState extends State<HotelsService> {
  Color deepPurple = Colors.deepPurpleAccent;
  Color pink = Colors.pink[600];
  Color blue = Colors.indigo;
  Color black = Colors.black;
  Color grey = Colors.grey[900];

  String dropdownValue = 'Cairo';
  List<String>_hotelCityNames=[];
  double minPrice = 0;
  double maxPrice = 2000;
  double _lowerValue = 50;
  double _upperValue = 500;

  List<Hotel> filteredList;

  List<Hotel> hotelList;
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    hotelList = new List();
    filteredList = new List();
  }

  @override
  Widget build(BuildContext context) {
    hotelList = Provider.of<List<Hotel>>(context);

    if (isEmpty && filteredList.length == 0 && hotelList != null) {
      filteredList = hotelList;
    }
    return Container(
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Column(
          children: [
            head(),
            SizedBox(
              height: 10,
            ),
            filteredList.length == 0
                ? Container(child: Text("No Data"))
                : hotelSearch(
                    hotelList: filteredList,
                  ),
          ],
        ),
      ),
    );
  }

  Widget head() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 55,
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey[50],
                        child: IconButton(
                          icon: Icon(
                            Icons.tune,
                            color: blue,
                          ),
                          onPressed: () {
                            _showFilter(context);
                          },
                        ),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[700],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: blue,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onChanged: (input) {
                    if (input.length == 0)
                      filteredList = hotelList;
                    if (input.length > 0) {
                      filteredList = filteredList
                          .where(
                            (element) =>
                                element.hotelName.toLowerCase().contains(input),
                          )
                          .toList();
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


  void _showFilter(context)async {
    HotelSearchModel model = HotelSearchModel();
    var result = await showBarModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Filters",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: pink,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "City:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) =>
                            Align(
                          alignment: Alignment.topLeft,
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            style: TextStyle(color: Color(0xff77747b)),

                            items: <String>[
                              'Cairo',
                              'Giza',
                              'Sharm ElSheikh',
                              'Luxor',
                              'Aswan',
                              'Hurghada',
                              'Alexandria',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Row(children: [
                                  Icon(
                                    FontAwesomeIcons.mapMarkerAlt,
                                    color: deepPurple,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(value),
                                ]),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                              model.cityName = newValue;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Price Range:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Minimum",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade900,
                            ),
                          ),
                          Text(
                            "Maximum",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 2.5,
                    activeTrackColor: deepPurple,
                    thumbColor: deepPurple,
                    valueIndicatorColor: deepPurple,
                    inactiveTrackColor: deepPurple.withOpacity(0.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: frs.RangeSlider(
                      min: minPrice,
                      max: maxPrice,
                      lowerValue: _lowerValue,
                      upperValue: _upperValue,
                      divisions: 5,
                      showValueIndicator: true,
                      valueIndicatorMaxDecimals: 1,
                      onChanged: (double newLowerValue, double newUpperValue) {
                        setState(() {
                          _lowerValue = newLowerValue;
                          _upperValue = newUpperValue;
                        });
                        model.lowerPrice = newLowerValue;
                        model.upperPrice = newUpperValue;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: 150,
                    height: 45,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      color: Colors.indigo,
                      child: Text(
                        'Save Filters',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      elevation: 8,
                      onPressed: () {
                        Navigator.of(context).pop(model);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });

    if (result != null) {
      searchByFilters(result);
    }
  }

  void searchByFilters(HotelSearchModel model) {
    if (model.cityName != null)
      filteredList = filteredList
          .where(
            (element) => element.hotelCity.contains(model.cityName),
      ).toList();

    if (model.lowerPrice != null&&model.upperPrice !=null)
      filteredList = filteredList.where(
            (element) {
          return element.priceOfDay >= model.lowerPrice &&
              element.priceOfDay <= model.upperPrice;
        },
      ).toList();

    if (filteredList.length == 0) isEmpty = false;

    setState(() {});
  }

}
