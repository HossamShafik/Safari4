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
          color: Colors.deepPurple,
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
                      color: Color(0xFFf8faf9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                  ),
                ),
                _profileImage(),
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
              radius: MediaQuery.of(context).size.width * 0.155,
              backgroundImage: AssetImage("assets/images/pro.jpg"),
            ),
            CustomPaint(
              painter: CirclePainter(),
              child: CircleAvatar(
                child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                backgroundColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ProfileInfo(){
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.245,
      left: 0,
      right: 0,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text("Infinite Loop",style: TextStyle(color: Color(0xFF323a5e),fontSize: 22,),),
          SizedBox(height: 5,),
          Text("InfiniteLoop@gmail.com",style: TextStyle(color: Colors.grey.shade600,fontSize: 16),),
          SizedBox(height: 20,),




          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text("FirstName",style: TextStyle(color: Colors.grey.shade800,fontSize: 16),),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width *0.9,
                height: MediaQuery.of(context).size.height *0.07,
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Infinite Loop",style: TextStyle(color: Colors.grey.shade800,fontSize: 16),),
                        IconButton(icon: Icon(Icons.edit), onPressed: null),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                ),

              ),
            ],
          ),
          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text("LastName",style: TextStyle(color: Colors.grey.shade800,fontSize: 16),),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width *0.9,
                height: MediaQuery.of(context).size.height *0.07,
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Flutter Project",style: TextStyle(color: Colors.grey.shade800,fontSize: 16),),
                        IconButton(icon: Icon(Icons.edit), onPressed: null),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                ),

              ),
            ],
          ),
          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text("Address",style: TextStyle(color: Colors.grey.shade800,fontSize: 16),),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width *0.9,
                height: MediaQuery.of(context).size.height *0.07,
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Giza,Dokki",style: TextStyle(color: Colors.grey.shade800,fontSize: 16),),
                        IconButton(icon: Icon(Icons.edit), onPressed: null),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                ),

              ),
            ],
          ),
          SizedBox(height: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text("Password",style: TextStyle(color: Colors.grey.shade800,fontSize: 16),),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width *0.9,
                height: MediaQuery.of(context).size.height *0.07,
                child: Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Change Password",style: TextStyle(color: Colors.grey.shade800,fontSize: 16),),
                        IconButton(icon: Icon(Icons.edit), onPressed: null),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                ),

              ),
            ],
          ),
          SizedBox(height: 15,),
          Center(
            child: FlatButton.icon(onPressed: (){}, icon: Icon(Icons.logout,color: Colors.red,size: 35,), label: Text("LogOut",style: TextStyle(
                color: Colors.red,fontSize: 24
            ),)),
          ),
        ],
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
        Color(0xFF323a5e),
        Color(0xFF323a5e),
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
        Color(0xFF323a5e),
        Color(0xFF323a5e),
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
    ..strokeWidth = 1
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
