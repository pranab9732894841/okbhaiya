import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuItem extends StatelessWidget {
  String title;
  String icon;
  String subTitle;
  VoidCallback onTap;
  MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.subTitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        // ignore: prefer_single_quotes
        icon,
        color: Theme.of(context).indicatorColor,
        semanticsLabel: 'A red up arrow',
        height: 80,
        width: 80,
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).indicatorColor,
      ),
    );
  }
}
