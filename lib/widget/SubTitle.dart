import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubTitle extends StatelessWidget {
  final String subTitleText;
  double size;
  SubTitle({
    Key? key,
    required this.subTitleText,
    this.size = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Text(
        subTitleText,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: size, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }
}
