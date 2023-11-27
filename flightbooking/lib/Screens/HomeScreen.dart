import 'package:flutter/material.dart';
import '../Screens/TicketView.dart';
import '../Utils/AppStyles.dart';
import '/Data.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgcolor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning",
                          style: Styles.headlinestyle3,
                        ),
                        SizedBox(height: 9),
                        Text(
                          username,
                          style: Styles.headlinestyle,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upcoming Flights", style: Styles.headlinestyle3),
                    InkWell(
                      onTap: () {
                        // Expand all tickets to choose one of them
                      },
                      child: Text("View All",
                          style: Styles.textStyle
                              .copyWith(color: Styles.primaryColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  // height: 170,
                  child: Row(
                    children: [
                      for (int index = 0; index < tickets.length; index++)
                        TicketView(ticket: tickets[index])
                    ],
                  ),
                ),
              ),

              //This what will show after the row of tickets
            ],
          ),
        ],
      ),
    );
  }
}
