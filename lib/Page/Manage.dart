import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:okbhaiya/models/businessUser.dart';
import 'package:okbhaiya/utils/customStyle.dart';
import 'package:okbhaiya/widget/MenuItem.dart';
import 'package:okbhaiya/widget/ProfileInfo.dart';

class ManageProfile extends StatefulWidget {
  User user;
  BusinessUser currentUser;
  VoidCallback openDrawer;
  ManageProfile({
    Key? key,
    required this.user,
    required this.currentUser,
    required this.openDrawer,
  }) : super(key: key);

  @override
  _ManageProfileState createState() => _ManageProfileState();
}

class _ManageProfileState extends State<ManageProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  // expandedHeight: 55.0,
                  elevation: 1,
                  floating: false,
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
                    'Manage Profile',
                    style: header,
                  ),
                  flexibleSpace: Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Container()),
                ),
                SliverToBoxAdapter(
                  child: ProfileInfo(
                    currentUser: widget.currentUser,
                  ),
                ),
              ];
            },
            body: Column(
              children: [
                Expanded(
                  child: ListView(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: ListTile.divideTiles(context: context, tiles: [
                      MenuItem(
                          title: 'Digital Menu settings',
                          icon: 'assets/icons/shop.svg',
                          subTitle: 'Manage delivery , payment , seo and more',
                          onTap: () {}),
                      MenuItem(
                          title: 'Link Devices',
                          icon: 'assets/icons/link.svg',
                          subTitle: 'Use OKBhaiya on your laptop & Desktop',
                          onTap: () {}),
                      MenuItem(
                          title: 'Refer and Earn',
                          icon: 'assets/icons/income.svg',
                          subTitle: 'Refer & eran Coin, unlock seo tools',
                          onTap: () {}),
                      MenuItem(
                          title: 'Qr Code',
                          icon: 'assets/icons/qrcode.svg',
                          subTitle: 'Download or Sheare Your Store Menu',
                          onTap: () {}),
                      MenuItem(
                          title: 'Help & Support',
                          icon: 'assets/icons/help.svg',
                          subTitle: 'Need any support or legal advice',
                          onTap: () {}),
                    ]).toList(),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
