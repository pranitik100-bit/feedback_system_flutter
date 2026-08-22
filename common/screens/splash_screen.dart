import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import "package:google_fonts/google_fonts.dart";
import 'role_selection.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splashes());
  }
}

class Splashes extends StatefulWidget {
  const Splashes({super.key});

  @override
  State<Splashes> createState() => _Splash_srn();
}

class _Splash_srn extends State<Splashes> {
  final PageController _controller = PageController();

  @override
  void initState() {
    //super.initState();

    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Role()),
      );
      // Your code here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: Image.asset(
                  "Assets/Images/Sp1.png",
                  fit: BoxFit.contain,
                  height: 500,
                  width: 400,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\nCollege",
                    style: GoogleFonts.tinos(color: Colors.white, fontSize: 28),
                  ),
                  Text(
                    "Feedback System",
                    style: GoogleFonts.tinos(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "Your Feedback, Our Improvement",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Positioned(
                top: 390,
                child: SpinKitFadingCircle(
                  duration: Duration(seconds: 6),
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

