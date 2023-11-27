// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import './TicketPage.dart';
import '../Utils/App_layout.dart';
import '../Widget/thick_container.dart';
import '../Utils/AppStyles.dart';
import '/Data.dart';

class Ticket {
  final String origin;
  final String destination;
  final String departureCity;
  final String arrivalCity;
  final String duration;
  final String date;
  final String departureTime;
  final String ticketNumber;

  Ticket({
    required this.origin,
    required this.destination,
    required this.departureCity,
    required this.arrivalCity,
    required this.duration,
    required this.date,
    required this.departureTime,
    required this.ticketNumber,
  });
}

class TicketView extends StatelessWidget {
  final Ticket ticket;

  const TicketView({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);

    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     // MaterialPageRoute(builder: (context) => TicketPage()),
      //   );
      // },
      child: SizedBox(
        width: size.width * 0.85,

        // Wrap the SizedBox with Expanded to take up available vertical space
        child: Expanded(
          child: Container(
            margin: const EdgeInsets.all(4),
            child: Column(children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(21),
                    topRight: Radius.circular(21),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          ticket.origin,
                          style: Styles.headlinestyle3
                              .copyWith(color: const Color(0xFF526799)),
                        ),
                        const Spacer(),
                        const thick_container(),
                        Expanded(
                            child: Stack(children: [
                          SizedBox(
                            height: 24,
                            //dots between airplane and big dot
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                print(
                                    "the width is ${constraints.constrainWidth()}");
                                return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        (constraints.constrainWidth() / 6)
                                            .floor(),
                                        (index) => const SizedBox(
                                              width: 3,
                                              height: 1,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF526799),
                                                ),
                                              ),
                                            )));
                              },
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: const Icon(Icons.local_airport_rounded,
                                  color: Color(0xFF526799)),
                            ),
                          ),
                        ])),
                        const thick_container(),
                        const Spacer(),
                        Text(ticket.destination,
                            style: Styles.headlinestyle3
                                .copyWith(color: const Color(0xFF526799))),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            ticket.departureCity,
                            style: Styles.headlinestyle4
                                .copyWith(color: const Color(0xFF526799)),
                          ),
                        ),
                        Text(
                          ticket.duration,
                          style: Styles.headlinestyle4
                              .copyWith(color: const Color(0xFF526799)),
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            ticket.arrivalCity,
                            textAlign: TextAlign.end,
                            style: Styles.headlinestyle4
                                .copyWith(color: const Color(0xFF526799)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                //color: const Color(0xFFF37B67),

                color: const Color(0xFF526799),
                child: Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Styles.bgcolor,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: LayoutBuilder(builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                (constraints.constrainWidth() / 15).floor(),
                                (index) => const SizedBox(
                                      width: 5,
                                      height: 1,
                                      child: DecoratedBox(
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                      ),
                                    )));
                      }),
                    )),
                    SizedBox(
                      height: 20,
                      width: 10,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color: Styles.bgcolor,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ),
                    ),
                  ],
                ),
              ),
              //this is the bottom part of the ticket
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 10,
                  right: 16,
                  bottom: 16,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ticket.date,
                              style: Styles.headlinestyle3
                                  .copyWith(color: const Color(0xFF526799)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Date",
                              style: Styles.headlinestyle4
                                  .copyWith(color: const Color(0xFF526799)),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              ticket.departureTime,
                              style: Styles.headlinestyle3
                                  .copyWith(color: const Color(0xFF526799)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Departure Time",
                              style: Styles.headlinestyle4
                                  .copyWith(color: const Color(0xFF526799)),
                            ),
                          ],
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                ticket.ticketNumber,
                                style: Styles.headlinestyle3
                                    .copyWith(color: const Color(0xFF526799)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Number",
                                  style: Styles.headlinestyle4.copyWith(
                                      color: const Color(0xFF526799))),
                            ]),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
