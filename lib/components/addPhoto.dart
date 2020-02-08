import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

class AddPhoto extends StatefulWidget {
  @override
  _AddPhotoState createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  File _image;

  Future getImage() async {
    final File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final String newPath = (await getApplicationDocumentsDirectory()).path;
    final String newFileName = Uuid().v4() + path.extension(image.path);
    final File copiedImage = await image.copy('$newPath/$newFileName');

    // TODO add media db entry for memory; use copiedImage.path
    print(copiedImage);
    setState(() {
      _image = copiedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a photo to your memory'),
      ),
      body: Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
