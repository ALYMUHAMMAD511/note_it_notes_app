import 'package:flutter/material.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
          text: 'Note',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
          children: <TextSpan>[
            TextSpan(
                text: 'It',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                )
            )
          ]
      ),
    );
  }
}