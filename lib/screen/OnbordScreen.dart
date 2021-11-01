// ignore: must_be_immutable
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:okbhaiya/screen/Authentication.dart';

// ignore: must_be_immutable
class OnbordScreen extends StatelessWidget {
  const OnbordScreen({Key? key}) : super(key: key);
  List<PageViewModel> getScreens(context) {
    return [
      PageViewModel(
        image: Image.network(
            'https://ik.imagekit.io/tltdafwyfpa/onbor1-_okbhaiya_ttED40agAij.png?updatedAt=1635504497549'),
        title: 'Digitize your way of doing business ',
        body:
            'Pre built Digital Product application for your outlet with customized option. So just kick start your business.',
        decoration: const PageDecoration(
          bodyTextStyle: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 14.0, color: Colors.grey),
        ),
        footer: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: ButtonTheme(
            minWidth: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // <-- Radius
                ),
                minimumSize: Size(double.infinity, 45),
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Authentication())),
              child: Text('Get Started'),
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 0.3, 0.5, 1],
                  // ignore: prefer_const_literals_to_create_immutables
                  colors: <Color>[
                    Color(0xfffca311),
                    Color(0xfff72585),
                    Color(0xff023e8a),
                    Color(0xffe5e5e5)
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: const [
                    0.0,
                    0.3,
                    1.0
                  ],
                      colors: [
                    Color(0xfffca311),
                    Color(0xfffca311).withOpacity(0.8),
                    Color(0xfffca311).withOpacity(0.1),
                  ])),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Text(''),
          ),
          ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(stops: const [
                0.0,
                0.3,
                0.5,
                0.6,
                1.0
              ], colors: [
                Color(0xffe5e5e5),
                Color(0xFFFFDCDC).withOpacity(0.7),
                Color(0xFFFFDCDC).withOpacity(0.5),
                Color(0xFFFFDCDC).withOpacity(0.5),
                Color(0xFFFFDCDC).withOpacity(0.2),
              ])),
            ),
          ),
          ClipRRect(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(stops: const [
                0.0,
                1.0
              ], colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.2)
              ])),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Text(''),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: IntroductionScreen(
                globalBackgroundColor: Colors.transparent,
                done: Text(''),

                onDone: () => {},
                pages: getScreens(context),
                showNextButton: false,
                showSkipButton: false,
                // next: Text("Next", style: TextStyle(fontWeight: FontWeight.w600)),
                color: Theme.of(context).primaryColor,
                doneColor: Theme.of(context).primaryColor,
                // nextColor: Theme.of(context).primaryColor,
                // skipColor: Theme.of(context).primaryColor,
                // skip: const Text("Skip",
                //     style: TextStyle(fontWeight: FontWeight.w600)),
                dotsDecorator: DotsDecorator(
                    size: const Size.square(10.0),
                    activeSize: const Size(20.0, 10.0),
                    activeColor: Theme.of(context).primaryColor,
                    color: Colors.black26,
                    spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0))),
              ),
            ),
          ),
        ]));
  }
}
