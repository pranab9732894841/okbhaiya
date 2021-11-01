import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  String imageUrl;
  double width;
  double height;
  final Function(String path, String imagename) onImageSelected;
  ImagePickerWidget(
      {Key? key,
      this.imageUrl = 'none',
      this.width = 100,
      this.height = 100,
      required this.onImageSelected})
      : super(key: key);

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
    widget.onImageSelected(imagePath.path, imageName.path);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.imageUrl == 'none' ? pickImage : () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            // border: Border.all(color: Color(0xfff72585), width: 6),
            color: const Color(0xffe5e5e5),
            image: widget.imageUrl == 'none' || _image == null
                ? DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover,
                  )
                : DecorationImage(
                    image: FileImage(_image!),
                    fit: BoxFit.cover,
                  ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget.imageUrl == 'none' && _image == null
                ? CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/images/upload.png',
                      fit: BoxFit.cover,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}


// SizedBox(
//                 height: 150,
//                 width: 150,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8.0),
//                   child: AspectRatio(
//                     aspectRatio: 1 / 1,
//                     child: Image.file(
//                       _image!,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//               ),