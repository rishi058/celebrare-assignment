import 'package:celebrare/widget/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:typed_data';


Future<Uint8List?> imagePicker() async {
  ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(
    source: ImageSource.gallery,
  );
  if (file != null) {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: file.path,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.teal,
            toolbarWidgetColor: Colors.white,
            lockAspectRatio: false
        ),
      ],
    );
    return croppedFile?.readAsBytes();
  }
  // print('No Image Selected');
}
