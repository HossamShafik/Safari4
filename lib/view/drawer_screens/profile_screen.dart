import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Color deepPurple = Colors.deepPurpleAccent;
  Color pink = Colors.pink[600];
  Color blue = Colors.indigo;
  Color black = Colors.black;
  Color grey = Colors.grey[900];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.indigo[800],
        ),
        CustomPaint(
          painter: Background(),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
                Navigator.pop(context);
              }),
              title: Text("Profile"),
              centerTitle: true,
            ),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                  ),
                ),
                _profileImage(),
                ProfileUser(),
                ProfileInfo(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileImage() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.05,
      left: MediaQuery.of(context).size.width / 2.9,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: MediaQuery.of(context).size.width * 0.18,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.170,
              backgroundImage: AssetImage("assets/images/pro.jpg"),
            ),
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                backgroundColor: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ProfileUser(){
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.245,
      left: 0,
      right: 0,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text("Infinite Loop",style: TextStyle(color: black,fontSize: 22,fontWeight: FontWeight.w600),),
          SizedBox(height: 5,),
          Text("InfiniteLoop@gmail.com",style: TextStyle(color: Colors.grey[500],fontSize: 16,fontWeight: FontWeight.w500),),
          SizedBox(height: 15,),
        ],
      ),
    );
  }

  Widget ProfileInfo(){
    return
      Positioned(
        top: MediaQuery.of(context).size.height * 0.350,
        left: 0,
        right: 0,
        bottom: 0,
        child: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Full Name:',style: TextStyle(fontWeight: FontWeight.w600,color: blue,fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('Infinite',style: TextStyle(color: Colors.grey[500],),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[50],
                                    ),
                                    width: 35,
                                    height: 35,
                                    child: Icon(Icons.edit,color: blue,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address:',style: TextStyle(fontWeight: FontWeight.w600,color: blue,fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('Giza,Dokki',style: TextStyle(color: Colors.grey[500],),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[50],
                                    ),
                                    width: 35,
                                    height: 35,
                                    child: Icon(Icons.edit,color: blue,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Password:',style: TextStyle(fontWeight: FontWeight.w600,color: blue,fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('Change Password',style: TextStyle(color: Colors.grey[500],),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[50],
                                    ),
                                    width: 35,
                                    height: 35,
                                    child: Icon(Icons.edit,color: blue,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone:',style: TextStyle(fontWeight: FontWeight.w600,color: blue,fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('Loop',style: TextStyle(color: Colors.grey[500],),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[50],
                                    ),
                                    width: 35,
                                    height: 35,
                                    child: Icon(Icons.edit,color: blue,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Gender:',style: TextStyle(fontWeight: FontWeight.w600,color: blue,fontSize: 16),),
                        SizedBox(height: 5,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('Loop',style: TextStyle(color: Colors.grey[500],),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: (){

                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey[50],
                                    ),
                                    width: 35,
                                    height: 35,
                                    child: Icon(Icons.edit,color: blue,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      );
  }
}

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    _circle5(canvas, size);
    _circle3(canvas, size);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  void _circle3(Canvas canvas, Size size) {
    Gradient gradient1 = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.indigo,
        Colors.indigo,
      ],
      stops: [0.0, 0.3],
    );
    Paint paint1 = Paint();
    Rect rect1 = Rect.fromLTWH(0, 0, size.width, size.height);
    paint1.shader = gradient1.createShader(rect1);
    Offset offset1 =
    Offset(size.width - (size.width * 0.05), size.height * 0.1);
    Offset offset2 =
    Offset(size.width - (size.width * 0.05) - 3, size.height * 0.1 - 3);
    Path path = Path();
    Rect rect = Rect.fromCircle(center: offset2, radius: 175);
    path.addOval(rect);
    canvas.drawShadow(path, Colors.black.withOpacity(0.4), 6, true);
    canvas.drawCircle(offset1, 170, paint1);
  }

  void _circle5(Canvas canvas, Size size) {
    Gradient gradient5 = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.indigo,
        Colors.indigo,
      ],
      stops: [0.2, 0.4],
    );
    Paint paint5 = Paint();
    Rect rect7 = Rect.fromLTWH(0, 0, size.width, size.height);
    paint5.shader = gradient5.createShader(rect7);
    Offset offset7 = Offset(size.width * 0.1 - (size.width * 0.25),
        size.height - (size.height * 0.65));
    Offset offset8 = Offset(size.width * 0.1 - (size.width * 0.25) - 3,
        size.height - (size.height * 0.65) - 3);
    Path path4 = Path();
    Rect rect8 = Rect.fromCircle(center: offset8, radius: 163);
    path4.addOval(rect8);
    canvas.drawShadow(path4, Colors.black.withOpacity(0.4), 8, true);
    canvas.drawCircle(offset7, 155, paint5);
  }
}

class CirclePainter extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.white
    ..strokeWidth = 4
  // Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
