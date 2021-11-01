import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okbhaiya/models/Navigation.dart';

// ignore_for_file: prefer_single_quotes

// ignore: must_be_immutable
class Sidenavigation extends StatelessWidget {
  User user;
  bool isLoading;
  String name;
  String number;
  bool verified;
  ValueChanged<NavitionItem> onScelectedItem;
  Sidenavigation({
    Key? key,
    required this.user,
    required this.isLoading,
    required this.name,
    required this.number,
    required this.verified,
    required this.onScelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            if (isLoading) ...[
              SpinKitThreeBounce(
                color: Theme.of(context).scaffoldBackgroundColor,
                size: 20,
              )
            ],
            if (!isLoading) ...[
              buildHeader(
                  name: name,
                  urlImage: "assets/images/Icon.png",
                  number: number,
                  verified: verified),
            ],
            buildNavitionItems(context),
          ],
        ),
      ),
    );
  }

  buildNavitionItems(BuildContext context) {
    return Column(
      children: NavitionItems.all
          .map((item) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      item.icon,
                      semanticsLabel: 'A red up arrow',
                      height: 20,
                      width: 20,
                    ),
                    title: Text(
                      item.titel,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                    // ignore: deprecated_member_use
                    hoverColor: Theme.of(context).accentColor,
                    onTap: () => onScelectedItem(item),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget buildHeader(
          {required String urlImage,
          required String name,
          required String number,
          required bool verified}) =>
      InkWell(
        onTap: () {},
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              child: Image.asset(urlImage),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number,
                  style: TextStyle(
                      fontSize: 8,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 2),
                SizedBox(
                  width: 100,
                  child: FittedBox(
                    child: Text(
                      name.toUpperCase(),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            if (verified) ...[
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.transparent,
                child: Icon(Icons.verified,
                    color: verified ? Colors.white : Colors.white),
              )
            ],
          ],
        ),
      );
}
