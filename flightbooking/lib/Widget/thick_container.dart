import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class thick_container extends StatelessWidget {
  const thick_container({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border:  Border.all(width: 2.5, color:const Color(0xFF526799)),
      ),
    );
  }
}
