import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:okbhaiya/screen/Registration/BusinessDetails.dart';
import 'package:okbhaiya/screen/Registration/Register.dart';

class Registration extends StatefulWidget {
  User user;
  int activeStep;
  Registration({
    Key? key,
    required this.user,
    required this.activeStep,
  }) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  List<String> labels = ['Business Details', 'Register Page'];

  void handleNext() {
    setState(() {
      widget.activeStep++;
    });
  }

  void handleBack() {
    setState(() {
      widget.activeStep--;
    });
  }

  Widget handleStep(int step) {
    switch (step) {
      case 0:
        return BusinessDetails(title: labels[step], handleNext: handleNext);
      case 1:
        return Register(
          title: labels[step],
          user: widget.user,
        );
      default:
        return BusinessDetails(title: labels[step], handleNext: handleBack);
    }
  }

  @override
  Widget build(BuildContext context) {
    return handleStep(widget.activeStep);
  }
}
