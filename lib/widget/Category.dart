import 'dart:math';

import 'package:flutter/material.dart';

import 'package:okbhaiya/models/Category.dart';

// ignore: must_be_immutable
class CategoryView extends StatelessWidget {
  Category category;
  CategoryView({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          child: Stack(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network(
                      category.image,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              if (!category.featured)
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: Text(
                        'Cooming Soon',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: Text(
            category.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
