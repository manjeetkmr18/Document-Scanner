import 'dart:io';

import 'package:flutter/material.dart';

class SingleImage extends StatelessWidget {
  final File imgFile;
  final String fileName;

  const SingleImage({Key key, this.imgFile, this.fileName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(fileName),
      ),
      body: Center(
          child: Container(
        child: Image.file(imgFile),
      )),
    );
  }
}
