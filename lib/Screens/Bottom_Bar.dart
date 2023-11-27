// ignore_for_file: unused_import

import 'package:flightbooking/Screens/SearchPage.dart';
import 'package:flightbooking/Screens/TicketView.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/HomeScreen.dart';
import '../Screens/TicketPage.dart';

import 'package:flightbooking/Data.dart';
import './RegisterScreen.dart';

class Bottom_Bar extends StatefulWidget {
  final String username;

  const Bottom_Bar({Key? key, required this.username}) : super(key: key);

  @override
  _Bottom_BarState createState() => _Bottom_BarState(username: username);
}

class _Bottom_BarState extends State<Bottom_Bar> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [];

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      HomeScreen(username: widget.username),
      SearchPage(allTickets: tickets),
      
    ];
  }

  _Bottom_BarState({required String username});

  //method for dynamic menu items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: "Search"),
         
        ],
      ),
    );
  }
}
