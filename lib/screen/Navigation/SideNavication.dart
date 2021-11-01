import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:okbhaiya/models/Navigation.dart';
import 'package:okbhaiya/provider/AuthenticationProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okbhaiya/widget/ImagePiker.dart';

import '../../main.dart';
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
                  urlImage: "assets/images/upload.png",
                  number: "Hi ,",
                  verified: verified),
            ],
            SizedBox(height: 10),
            buildNavitionItems(context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 1,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            buldLogoutButton(context),
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
                    child: InkWell(
                      onTap: () => onScelectedItem(item),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              item.icon,
                              color: Theme.of(context).scaffoldBackgroundColor,
                              semanticsLabel: 'A red up arrow',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          Text(
                            item.titel,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          )
                        ],
                      ),
                    )),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ImagePickerWidget(
                height: 50,
                width: 50,
                onImageSelected: (String path, String imagename) {
                  print(path);
                  print(imagename);
                },
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    number,
                    style: TextStyle(
                        fontSize: 12,
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
        ),
      );

  buldLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.read(authServiceProvider).signOut().then((value) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AuthenticationWrapper(),
                ));
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/icons/logout.svg",
                    color: Theme.of(context).scaffoldBackgroundColor,
                    semanticsLabel: 'A red up arrow',
                    height: 20,
                    width: 20,
                  ),
                ),
                Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).scaffoldBackgroundColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
