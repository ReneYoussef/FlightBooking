// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/Bottom_Bar.dart';
import '../Screens/RegisterScreen.dart';

class StarterScreen extends StatelessWidget {
  const StarterScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/R.jpeg'), // Make sure the file path is correct
            fit: BoxFit
                .cover, // You can change the BoxFit according to your needs
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'SKYLINK',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 90.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Airline Booking System',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                  height: 140.0), // Optional spacing between texts and button
              Text(
                '___ Welcome On Board ___',
                style: GoogleFonts.theNautigal(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 31.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              SizedBox(
                  height:
                      380.0), // Optional spacing between the welcome message and button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
