import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okbhaiya/models/Category.dart';

import 'package:okbhaiya/provider/AuthenticationProvider.dart';
import 'package:okbhaiya/widget/Category.dart';
import 'package:okbhaiya/widget/ImagePiker.dart';

// ignore: must_be_immutable
class BusinessDetails extends StatefulWidget {
  String title;
  VoidCallback handleNext;
  BusinessDetails({
    Key? key,
    required this.title,
    required this.handleNext,
  }) : super(key: key);

  @override
  _BusinessDetailsState createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.label_important,
            color: Theme.of(context).indicatorColor,
          ),
          onPressed: () {},
        ),
        // ignore: deprecated_member_use
        backwardsCompatibility: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: ButtonTheme(
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    // <-- Radius
                  ),
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: () => {},
                child: Text('Next'),
              ),
            ),
          ),
        ],
        title: Text(widget.title,
            style: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        elevation: 1,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // ImagePickerWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusColor: Colors.teal[800],
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context).indicatorColor),
                            ),
                            contentPadding: EdgeInsets.only(
                                left: 16, bottom: 0, right: 0, top: 20),
                            hintText: 'Business Name ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 3,
                          decoration: InputDecoration(
                            focusColor: Colors.teal[800],
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context).indicatorColor),
                            ),
                            contentPadding: EdgeInsets.only(
                                left: 16, bottom: 0, right: 0, top: 20),
                            hintText: 'Business Bio ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusColor: Colors.teal[800],
                            suffix: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context).indicatorColor),
                            ),
                            contentPadding: EdgeInsets.only(
                                left: 16, bottom: 0, right: 8, top: 0),
                            hintText: 'Business Category ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          minLines: 5,
                          decoration: InputDecoration(
                            focusColor: Colors.teal[800],
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context).indicatorColor),
                            ),
                            contentPadding: EdgeInsets.only(
                                left: 16, bottom: 0, right: 0, top: 20),
                            hintText: 'Business Adress ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
