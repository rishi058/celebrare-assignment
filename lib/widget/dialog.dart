import 'dart:typed_data';
import 'package:celebrare/enums/shapes.dart';
import 'package:celebrare/widget/custom_box.dart';
import 'package:celebrare/widget/masking.dart';
import 'package:flutter/material.dart';
import 'package:celebrare/main.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key, required this.image});

  final Uint8List image;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {

  @override
  void initState() {
    selectedShape = Shape.original;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 450.0,
        width: 350.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {
                      selectedShape = Shape.none;
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.cancel, color: Colors.grey,))),
            Container(
              margin: const EdgeInsets.fromLTRB(18, 2.5, 0, 15),
              child: const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Uploaded Image',
                  style:
                  TextStyle(fontSize: 17, fontFamily: 'LoraItalic'),
                ),
              ),
            ),
            SizedBox(
              height: 240,
              child: Center(
                child: selectedShape == Shape.original ? Image.memory(widget.image) :
                selectedShape == Shape.heart ? MaskedImage(asset: widget.image, mask: 'assets/heart.png') :
                selectedShape == Shape.square ? MaskedImage(asset: widget.image, mask: 'assets/square.png') :
                selectedShape == Shape.rectangle ? MaskedImage(asset: widget.image, mask: 'assets/rectangle.png') :
                selectedShape == Shape.circle ? MaskedImage(asset: widget.image, mask: 'assets/circle.png') : const SizedBox(height:0),
              ),
            ),

            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedShape = Shape.original;
                      });
                    },
                    child: originalBox()),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedShape = Shape.heart;
                    });
                  },
                  child: shapeBox('assets/heart.png'),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedShape = Shape.square;
                    });
                  },
                  child: shapeBox('assets/square.png'),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedShape = Shape.circle;
                    });
                  },
                  child: shapeBox('assets/circle.png'),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedShape = Shape.rectangle;
                    });
                  },
                  child: shapeBox('assets/rectangle.png'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.teal.shade600,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                    child: Text(
                      "Use this Image",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
