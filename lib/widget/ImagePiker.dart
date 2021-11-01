import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key? key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _image;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageName = File(image.name);
    final imagePath = File(image.path);
    setState(() {
      _image = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: _image == null
            ? InkWell(
                onTap: pickImage,
                child: Stack(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: MediaQuery.of(context).size.width / 2 - 65,
                      child: Center(
                        child: Icon(
                          CupertinoIcons.photo_camera,
                          size: 100,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: MediaQuery.of(context).size.width / 2 - 80,
                      child: Center(
                        child: Text('Upload Your Logo',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).indicatorColor)),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(
                height: 150,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.file(
                      _image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
