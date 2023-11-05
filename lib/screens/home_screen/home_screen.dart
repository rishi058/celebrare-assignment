import 'package:celebrare/enums/shapes.dart';
import 'package:celebrare/main.dart';
import 'package:celebrare/widget/custom_button.dart';
import 'package:celebrare/widget/dialog.dart';
import 'package:celebrare/widget/masking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widget/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Image / Icon',
          style: TextStyle(
              color: Colors.grey.shade600,
              fontFamily: 'LoraItalic',
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        elevation: 3.5,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              SystemNavigator.pop();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(15),
              ),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Upload Image',
                    style: TextStyle(
                        color: Colors.grey.shade600, fontFamily: 'LoraItalic'),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      await imagePicker().then((picture) {
                        if (picture != null) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDialog(image: picture);
                            },
                          ).then((value) {
                            setState(() {
                              image = picture;
                            });
                          });
                        }
                      });
                    },
                    child: const CustomButton(text: 'Choose from Device'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (image != null && selectedShape != Shape.none) Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: selectedShape == Shape.original
                        ? Image.memory(image!)
                        : selectedShape == Shape.heart
                            ? MaskedImage(asset: image!, mask: 'assets/heart.png')
                            : selectedShape == Shape.square
                                ? MaskedImage(
                                    asset: image!, mask: 'assets/square.png')
                                : selectedShape == Shape.rectangle
                                    ? MaskedImage(
                                        asset: image!,
                                        mask: 'assets/rectangle.png')
                                    : selectedShape == Shape.circle
                                        ? MaskedImage(
                                            asset: image!,
                                            mask: 'assets/circle.png')
                                        : const SizedBox(height: 0),
                  ) else const SizedBox(height: 0)
          ],
        ),
      ),
    );
  }
}
