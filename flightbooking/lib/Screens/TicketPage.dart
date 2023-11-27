import 'package:flightbooking/Screens/TicketView.dart';
import 'package:flutter/material.dart';
import 'package:flightbooking/Utils/AppStyles.dart';

class TicketPage extends StatelessWidget {
  final Ticket ticket;

  TicketPage({required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Ticket'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display Ticket Information
            Text(
              'Ticket Number: ${ticket.ticketNumber}',
              style: Styles.headlinestyle,
            ),
            SizedBox(height: 10),
            Text(
              'Origin: ${ticket.origin}',
              style: Styles.textStyle,
            ),
            Text(
              'Destination: ${ticket.destination}',
              style: Styles.textStyle,
            ),
            Text(
              'Departure City: ${ticket.departureCity}',
              style: Styles.textStyle,
            ),
            Text(
              'Arrival City: ${ticket.arrivalCity}',
              style: Styles.textStyle,
            ),
            Text(
              'Duration: ${ticket.duration}',
              style: Styles.textStyle,
            ),
            Text(
              'Date: ${ticket.date}',
              style: Styles.textStyle,
            ),
            Text(
              'Departure Time: ${ticket.departureTime}',
              style: Styles.textStyle,
            ),
            // Add more ticket information as needed

            // Add a button to download as PDF or image
            ElevatedButton(
              onPressed: () {
                // Implement the download functionality
                // You can use a package like pdf or image library to create/download PDF or image
                // Example: create a PDF with ticket information and provide a download link
              },
              child: Text('Download as PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
