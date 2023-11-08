import 'dart:ui';

import 'package:flutter/material.dart';

void main() {

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    var media= MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
Positioned(
    bottom:0,
          child: Container(
            width: media.width,
            height: media.height-80,

            child: Stack(
            children: [
              CustomPaint(
                size: Size(media.width,media.height),
                painter:PainterCustom() ,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NextScreen()),
                    );
                  },
                  child: const Text("Go to next screen"),
                ),
              )],
          ),

)),
          Positioned(
            top: media.width * 0.15,
            left: media.width * 0.34,
            child: Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: ClipOval( // Clip the image to the shape of the container
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFYh_02ZzafO6e51FFkMldACp56PhV29EkiA&usqp=CAU',
                  fit: BoxFit.cover, // Adjust the image fit within the container
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
class PainterCustom extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color=Colors.white..style= PaintingStyle.fill;
    Path path = Path()..moveTo(0, 30);
    path.quadraticBezierTo(size.width*0.0, 0, size.width*0.20, 0);
    path.quadraticBezierTo(size.width*0.30, 0, size.width*0.20, 0);
    path.quadraticBezierTo(size.width*0.30, 0, size.width*0.30, 30);
    path.arcToPoint(Offset(size.width*0.69, 30)
        ,radius: const Radius.circular(20.0),clockwise: false);
    path.quadraticBezierTo(size.width*0.69, 0, size.width*0.75, 0);
    path.quadraticBezierTo(size.width*0.78, 0,size.width*0.90, 0);
    path.quadraticBezierTo(size.width*0.78, 0,size.width*0.90, 0);
    path.quadraticBezierTo(size.width*0.99, 0,size.width, 30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 9, true);
    path.close();

    canvas.drawPath(path, paint);

 

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
class PainterCustom2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 30)
      ..quadraticBezierTo(0.0, 0, size.width * 0.10, 0)
      ..quadraticBezierTo(size.width * 0.10, 0, size.width * 0.20, 0)
      ..quadraticBezierTo(size.width * 0.30, 0, size.width * 0.34, 20)
      ..arcToPoint(
        Offset(size.width * 0.60, 20),
        radius: const Radius.circular(60.0),
        clockwise: false,
        rotation: 20,
      )
      ..quadraticBezierTo(size.width * 0.65, 0, size.width * 0.75, 0)
      ..quadraticBezierTo(size.width * 0.78, 0, size.width * 0.90, 0)
      ..quadraticBezierTo(size.width, 0, size.width, 30)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawShadow(path, Colors.black, 10, false);
    Paint borderPaint = Paint()
      ..color = Colors.greenAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawPath(path, paint);
    // canvas.drawPath(path, borderPaint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    var media= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              child: SizedBox(
                width: media.width,
                height: 300,
                child: Image.network("https://i.pinimg.com/736x/4c/0b/ca/4c0bca2b9dba0bb70c2e7432cb281005.jpg",fit: BoxFit.fill,),)),
          Positioned(
    top: 0,
    child: BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 1),
    child: Opacity(
    opacity: 0.1,
    child: Container(
    color: Colors.white,
    width: media.width,
    height: 300,
    ),))),
          Positioned(
              top: 0,
              child: Container(
                color: Colors.white.withOpacity(.5),
                width: media.width,
                height: 300,
              )),
          Positioned(
              bottom:0,
              child: Container(
                width: media.width,
                height: media.height-200,
                child: Stack(
                children: [
                  CustomPaint(
                    size: Size(media.width,media.height),
                    painter:PainterCustom2() ,
                  ),



        ]
      ),
    )
      ),
          Positioned(
              top: 35,
              child: SizedBox(
                width: media.width,
                height: media.height,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                children: [
Text(
  "Ma Carte de presentation",style: TextStyle(
  fontSize: 18,fontWeight: FontWeight.bold,color: Colors.brown.withOpacity(.8)
),
)
                ],
      ),
    )
      ),
           Positioned(
            top: 40,
              right: 20,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.brown.withOpacity(0.3), // Set the shadow color to green with opacity
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, -3), // Adjust the shadow offset as needed
                    ),
                  ],
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                Icons.menu,
                  size: 20,
    ),
              )
      ),
           const Positioned(
            top: 60,
            left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Foulen Profil",style: TextStyle(
                        fontSize: 14,fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0.0),
                    child: Text(
                      "stagiere en boulangerie",style: TextStyle(color: Colors.brown,
                        fontSize: 12,fontWeight: FontWeight.normal
                    ),
                    ),
                  ) ,
                  Padding(
                    padding: EdgeInsets.only(top: 2.0),

                    child: Row(
                      children: [
                        Icon(Icons.email,color: Colors.brown,size: 15,),
                        SizedBox(width: 3),
                        Text(
                          "abc@gmail.com",style: TextStyle(color: Colors.brown,
                            fontSize: 12,fontWeight: FontWeight.normal
                        ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.0),

                    child: Row(
                      children: [
                        Icon(Icons.phone,color: Colors.brown,size: 15,),
                        SizedBox(width: 3),
                        Text(
                          "abc@gmail.com",style: TextStyle(color: Colors.brown,
                            fontSize: 12,fontWeight: FontWeight.normal
                        ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2.0),
                    child: Row(
                      children: [
                        Icon(Icons.sports_basketball,color: Colors.brown,size: 15,),
                        SizedBox(width: 3),
                        Text(
                          "aabbc.com",style: TextStyle(color: Colors.brown,
                            fontSize: 12,fontWeight: FontWeight.normal
                        ),
                        ),
                      ],
                    ),
                  ),

                ],
              )
      ),
          Positioned(
            top: media.width * 0.38,
            left: media.width * 0.34,
            child: Container(
              width: 100,
              height: 100,
              decoration:  BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white, // Set the border color to green
                    width: 2.0, // Adjust the border width as needed
                  ),
                  boxShadow: [
              BoxShadow(
              color: Colors.brown.withOpacity(0.5), // Set the shadow color to green with opacity
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, -3), // Adjust the shadow offset as needed
            ),
            ]
              ),


              child: ClipOval( // Clip the image to the shape of the container
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFYh_02ZzafO6e51FFkMldACp56PhV29EkiA&usqp=CAU',
                  fit: BoxFit.cover, // Adjust the image fit within the container
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}

