import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okbhaiya/screen/Navigation/Navigation.dart';
import 'package:okbhaiya/widget/EmtySection.dart';

// ignore: must_be_immutable
class SuccessScreen extends StatefulWidget {
  User user;
  SuccessScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
  }

  void nextScreen() {
    Timer(Duration(seconds: 1), () => print('done'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          EmptySection(
            emptyImg: 'assets/images/success.gif',
            emptyMsg: 'Successful !',
          ),
        ],
      ),
    );
  }
}
