import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:okbhaiya/models/businessUser.dart';
import 'package:okbhaiya/provider/AuthenticationProvider.dart';
import 'package:okbhaiya/utils/customStyle.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  User user;
  BusinessUser currentUser;
  VoidCallback openDrawer;
  HomePage({
    Key? key,
    required this.user,
    required this.currentUser,
    required this.openDrawer,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool verified = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    clinic();
  }

  Future<BusinessUser?> clinic() async {
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                // expandedHeight: 55.0,
                actions: [
                  Switch(
                    value: verified,
                    onChanged: (value) {
                      setState(() {
                        verified = value;
                      });
                    },
                    activeTrackColor: Colors.lightGreenAccent,
                    activeColor: Colors.green,
                  ),
                ],
                elevation: 1,
                floating: true,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        widget.openDrawer();
                      },
                      child: ClipOval(
                        child: Container(
                          color: Theme.of(context).indicatorColor,
                          child: Center(
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                backgroundColor: Theme.of(context).backgroundColor,
                pinned: true,
                centerTitle: true,
                title: Text(
                  'Dashbord',
                  style: header,
                ),
                flexibleSpace: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Container()),
              )
            ];
          },
          body: Container(
            color: Theme.of(context).backgroundColor,
          ),
        ),
      ),
    );
  }
}

class LiteRollingSwitch {}

class CustomSwitch {}
