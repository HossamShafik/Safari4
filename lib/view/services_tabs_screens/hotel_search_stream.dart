import 'package:flutter/material.dart';
import 'package:project/Controllers/firestore/DataBase.dart';
import 'package:project/models/hotel.dart';
import 'package:project/view/details_screens/hotel_details.dart';
import 'package:provider/provider.dart';
import 'hotel_service.dart';

class HotelSearchStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Hotel>>.value(
      value: DataBase().getAllHotels,
      catchError: (_, err) => throw Exception(err),
      child: HotelsService(),
    );
  }
}

class hotelSearch extends StatelessWidget {
  Color pink = Colors.pink[600];
  Color blue = Colors.indigo;
  Color red = Colors.redAccent;

  final hotelList;
  hotelSearch({@required this.hotelList});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.builder(
          itemCount: hotelList != null && hotelList.length > 0 ? hotelList.length : 0,
          itemBuilder: (context, index) {
            final Hotel currentHotel = hotelList[index];

            return Padding(
              padding: const EdgeInsets.only(top: 15),
              child: InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(currentHotel.images[0]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, top: 12),
                                  child: Text(
                                    currentHotel.hotelName ,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 9, top: 8),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_sharp,
                                        color: blue,
                                        size: 16,
                                      ),
                                      Text(
                                        currentHotel.hotelCity,
                                        style: TextStyle(),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 12, top: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Price : ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey[900]),
                                          ),
                                          Text(
                                            '${currentHotel.priceOfDay}' + 'L.E' + '/Day',
                                            style: TextStyle(
                                              color: pink.withOpacity(0.8),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12,bottom: 14,right: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){
                                    },
                                    child: Icon(
                                      Icons.favorite,color: red,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star_rate_rounded,
                                        size: 19,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        '${currentHotel.hotelRate}',
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HotelsDetailsScreen()));
                },
              ),
            );
          }),
    );
  }
}