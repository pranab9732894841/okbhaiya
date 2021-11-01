import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoaadingWindow extends StatelessWidget {
  const LoaadingWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Stack(
                children: [
                  SpinKitSquareCircle(
                    size: 200,
                    color: Theme.of(context).primaryColor,
                  ),
                  SpinKitSquareCircle(
                    size: 140,
                    color: Theme.of(context).accentColor,
                  ),
                  SpinKitSquareCircle(
                    size: 120,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ],
              ),
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Icon.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
