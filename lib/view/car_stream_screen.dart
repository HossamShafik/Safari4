
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project/Controllers/firestore/DataBase.dart';
import 'package:project/models/car.dart';

import 'package:provider/provider.dart';

class CarStream extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Cars>>.value(
      value: DataBase().getCars,
      catchError: (_, err) => throw Exception(err),
      child: CarWidget(),
    );
  }
}

class CarWidget extends StatelessWidget {

  Color primaryColor = Color(0xFF3C116B);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final carList = Provider.of<List<Cars>>(context);

    return Container(
      height: MediaQuery.of(context).size.height*0.75,
      child: StaggeredGridView.countBuilder(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemCount:
          carList != null && carList.length > 0 ? carList.length : 0,
          itemBuilder: (context, index) {
            final Cars currentCar = carList[index];
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(currentCar.carPhotos[0]),
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
                          child: Text(currentCar.carName,style: TextStyle(color: Colors.white,fontSize: 13),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5,top: 2),
                          child: Row(
                            children: [
                              Icon(Icons.location_on_sharp,color:Colors.redAccent,size: 16,),
                              Text(currentCar.carCity,style: TextStyle(color: Colors.white,fontSize: 11),),
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


