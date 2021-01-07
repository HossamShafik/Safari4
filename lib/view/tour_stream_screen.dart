
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project/Controllers/firestore/DataBase.dart';
import 'package:project/models/car.dart';
import 'package:project/models/tour.dart';

import 'package:provider/provider.dart';

class TourStream extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Tour>>.value(
      value: DataBase().getTours,
      catchError: (_, err) => throw Exception(err),
      child: TourWidget(),
    );
  }
}

class TourWidget extends StatelessWidget {

  Color primaryColor = Color(0xFF3C116B);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final tourList = Provider.of<List<Tour>>(context);

    return Container(
      height: MediaQuery.of(context).size.height*0.75,
      child: StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemCount:
          tourList != null && tourList.length > 0 ? tourList.length : 0,
          itemBuilder: (context, index) {
            final Tour currentTour = tourList[index];
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(currentTour.tourPhotos[1]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10),),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10),),
                      color: Colors.black.withOpacity(0.4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8,top: 4),
                          child: Text(currentTour.placeName,style: TextStyle(color: Colors.white,fontSize: 13),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5,top: 2),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_sharp,color:Colors.redAccent,size: 16,),
                              Text(currentTour.tourCity,style: TextStyle(color: Colors.white,fontSize: 11),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          staggeredTileBuilder: (index){
            return new StaggeredTile.count(1, index.isEven ? 1.8 : 1.2);
          }
      ),
    );

  }
}


