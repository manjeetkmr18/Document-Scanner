import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:documentscanner2/crop_painter.dart';
import 'package:documentscanner2/showImage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:image_size_getter/image_size_getter.dart';

class EditImage extends StatefulWidget {
  _EditImageState createState() => _EditImageState();
}

class _EditImageState extends State<EditImage> {
  MethodChannel channel = MethodChannel('opencv');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.green,
      ),
    );
  }
}

/**
 * lass _CropImageState extends State<CropImage> {
  final GlobalKey key = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double width, height;
  Size imagePixelSize;
  bool isFile = false;
  Offset tl, tr, bl, br;
  bool isLoading = false;
  MethodChannel channel = new MethodChannel('opencv');
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2000), getImageSize);
  }

 */
