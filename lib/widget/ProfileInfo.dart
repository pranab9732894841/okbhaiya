import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:okbhaiya/models/businessUser.dart';
import 'package:okbhaiya/widget/ImagePiker.dart';

// ignore: must_be_immutable
class ProfileInfo extends StatelessWidget {
  BusinessUser currentUser;
  ProfileInfo({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: [
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 200,
            ),
            Container(
              color: Theme.of(context).indicatorColor,
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    right: 0,
                    child: Text(
                      currentUser.businessName.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    right: 0,
                    child: Text(
                      currentUser.phoneNumber.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: SvgPicture.asset(
                      // ignore: prefer_single_quotes
                      "assets/icons/coin.svg",

                      semanticsLabel: 'A red up arrow',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  Positioned(
                    top: 76,
                    left: 70,
                    right: 0,
                    child: Text(
                      0.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: ImagePickerWidget(
                      onImageSelected: (String path, String imagename) {},
                      height: 60,
                      width: 60,
                      imageUrl:
                          'https://ik.imagekit.io/tltdafwyfpa/photo-1414235077428-338989a2e8c0_h985O7pLI.jpg?updatedAt=1635768144589',
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 26,
              right: 10,
              child: ButtonTheme(
                // minWidth: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // minimumSize: Size(double.infinity, 45),
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // <-- Radius
                      )),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Icon(
                        Icons.edit,
                        size: 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 0,
              child: Text(
                'PLAN: ${'Free For Ever'}',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).indicatorColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
