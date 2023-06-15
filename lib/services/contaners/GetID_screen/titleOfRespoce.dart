import 'package:flutter/material.dart';

class titleOfRespoce extends StatelessWidget {
  const titleOfRespoce({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
