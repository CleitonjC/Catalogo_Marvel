import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        'assets/images/background.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
