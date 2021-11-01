import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okbhaiya/Page/Home.dart';
import 'package:okbhaiya/main.dart';

import 'package:okbhaiya/models/Navigation.dart';
import 'package:okbhaiya/models/businessUser.dart';
import 'package:okbhaiya/models/picture.dart';
import 'package:okbhaiya/provider/AuthenticationProvider.dart';
import 'package:okbhaiya/screen/Navigation/SideNavication.dart';

// ignore: must_be_immutable
class NavitionRoute extends StatefulWidget {
  User user;
  NavitionRoute({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _NavitionRouteState createState() => _NavitionRouteState();
}

class _NavitionRouteState extends State<NavitionRoute> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  NavitionItem item = NavitionItems.home;
  bool isDragging = false;

  late BusinessUser currentuser;
  bool verified = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    closeDrawer();
    var businessUser = BusinessUser(
        businessName: '',
        category: [],
        coverlink: [],
        geo: Geo(lat: 0.0, lng: 0.0),
        id: '',
        logoLink: Pic(downloadUrl: '', filename: '', path: ''),
        phoneNumber: '',
        type: '',
        user: '');
    currentuser = businessUser;
    business();
  }

  Future<BusinessUser?> business() async {
    setState(() {
      isLoading = true;
    });
    context.read(dataProvider).getBusiness(widget.user.uid).then((value) {
      setState(() {
        currentuser = BusinessUser.fromMap(value);
        isLoading = false;
      });
    });
  }

  void openDrawer() => setState(() {
        xOffset = 200;
        yOffset = 100;
        scaleFactor = 0.8;
        isDrawerOpen = true;
      });
  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDrawerOpen = false;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).indicatorColor,
      body: Stack(
        children: [
          Container(
            width: xOffset,
            child: Sidenavigation(
              user: widget.user,
              name: currentuser.user,
              number: currentuser.phoneNumber,
              verified: verified,
              isLoading: isLoading,
              onScelectedItem: (item) {
                setState(() {
                  this.item = item;
                });
                closeDrawer();
              },
            ),
          ),
          buildPage(context)
        ],
      ),
    );
  }

  buildPage(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: () => closeDrawer(),
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;
          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
              child: Container(
                color: isDrawerOpen
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).scaffoldBackgroundColor,
                child: getNavigationPage(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  getNavigationPage(BuildContext context) {
    if (item == NavitionItems.doctors) {
      return Container();
    } else if (item == NavitionItems.logout) {
      context.read(authServiceProvider).signOut().then((value) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AuthenticationWrapper(),
        ));
      });
    } else {
      return Container(
        child: HomePage(user: widget.user, openDrawer: openDrawer),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.teal.shade900.withOpacity(0.8),
              blurRadius: 24.0,
            ),
          ],
        ),
      );
    }
  }
}
