import 'package:flightbooking/Screens/TicketPage.dart';
import 'package:flightbooking/Utils/AppStyles.dart';
import 'package:flutter/material.dart';
import './TicketView.dart';

class SearchPage extends StatefulWidget {
  final List<Ticket> allTickets;

  SearchPage({required this.allTickets});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController departureCityController = TextEditingController();
  TextEditingController arrivalCityController = TextEditingController();
  List<Ticket> filteredTickets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SizedBox(
          child: Container(
            color: Styles.bgcolor,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Padding(padding: const EdgeInsets.all(10)),
                TextField(
                  controller: departureCityController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.flight_takeoff),
                    contentPadding: const EdgeInsets.all(1),
                    labelText: 'Departure City ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: arrivalCityController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.flight_land),
                    contentPadding: const EdgeInsets.all(15),
                    labelText: 'Arrival City ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    String departureCity =
                        departureCityController.text.toLowerCase();
                    String arrivalCity =
                        arrivalCityController.text.toLowerCase();

                    setState(() {
                      filteredTickets = widget.allTickets.where((ticket) {
                        return ticket.departureCity
                                .toLowerCase()
                                .contains(departureCity) &&
                            ticket.arrivalCity
                                .toLowerCase()
                                .contains(arrivalCity);
                      }).toList();
                    });
                  },
                  child: Text(
                    'Filter Tickets',
                    style: Styles.text_Theme,
                  ),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredTickets.isNotEmpty
                        ? filteredTickets.length
                        : widget.allTickets.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Display a confirmation dialog
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Book Ticket'),
                                content:
                                    Text('Do you want to book this ticket?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, false);
                                    },
                                    child: Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    child: Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          ).then((value) {
                            // If user confirms, navigate to TicketView
                            if (value == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TicketPage(
                                    ticket: filteredTickets.isNotEmpty
                                        ? filteredTickets[index]
                                        : widget.allTickets[index],
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        child: Card(
                          child: TicketView(
                            ticket: filteredTickets.isNotEmpty
                                ? filteredTickets[index]
                                : widget.allTickets[index],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
