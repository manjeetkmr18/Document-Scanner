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

class NewImage extends StatefulWidget {
  File file;
  GlobalKey<AnimatedListState> animatedListKey;
  NewImage(this.file, this.animatedListKey);
  _NewImageState createState() => _NewImageState();
}

class _NewImageState extends State<NewImage> {
  final GlobalKey key = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double width, height;
  Size imagePixelSize;
  bool isFile = false;
  Offset tl, tr, bl, br;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2000), getImageSize);
  }

  void getImageSize() {
    RenderBox imageBox = key.currentContext.findRenderObject();
    width = imageBox.size.width;
    height = imageBox.size.height;
    imagePixelSize = ImageSizGetter.getSize(widget.file);
    tl = new Offset(20, 20);
    tr = new Offset(width - 20, 20);
    bl = new Offset(20, height - 20);
    br = new Offset(width - 20, height - 20);
    setState(() {
      isFile = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
              ),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                Timer(Duration(seconds: 1), () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ShowImage(
                            tl: tl,
                            tr: tr,
                            bl: bl,
                            br: br,
                            width: width,
                            height: height,
                            file: widget.file,
                            imagePixelSize: imagePixelSize,
                            animatedListKey: widget.animatedListKey,
                          )));
                });
              },

              // onPressed: () async {},
            ),
          ],
        ),
        key: _scaffoldKey,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  GestureDetector(
                    onPanDown: (details) {
                      double x1 = details.localPosition.dx;
                      double y1 = details.localPosition.dy;
                      double x2 = tl.dx;
                      double y2 = tl.dy;
                      double x3 = tr.dx;
                      double y3 = tr.dy;
                      double x4 = bl.dx;
                      double y4 = bl.dy;
                      double x5 = br.dx;
                      double y5 = br.dy;
                      if (sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)) <
                              30 &&
                          x1 >= 0 &&
                          y1 >= 0 &&
                          x1 < width / 1 &&
                          y1 < height / 1) {
                        print("SIMMI.....${details.localPosition}");
                        setState(() {
                          tl = details.localPosition;
                        });
                      } else if (sqrt((x3 - x1) * (x3 - x1) +
                                  (y3 - y1) * (y3 - y1)) <
                              30 &&
                          x1 >= width / 2 &&
                          y1 >= 0 &&
                          x1 < width &&
                          y1 < height / 2) {
                        setState(() {
                          tr = details.localPosition;
                        });
                      } else if (sqrt((x4 - x1) * (x4 - x1) +
                                  (y4 - y1) * (y4 - y1)) <
                              30 &&
                          x1 >= 0 &&
                          y1 >= height / 2 &&
                          x1 < width / 2 &&
                          y1 < height) {
                        setState(() {
                          bl = details.localPosition;
                        });
                      } else if (sqrt((x5 - x1) * (x5 - x1) +
                                  (y5 - y1) * (y5 - y1)) <
                              30 &&
                          x1 >= width / 2 &&
                          y1 >= height / 2 &&
                          x1 < width &&
                          y1 < height) {
                        setState(() {
                          br = details.localPosition;
                        });
                      }
                    },
                    onPanUpdate: (details) {
                      double x1 = details.localPosition.dx;
                      double y1 = details.localPosition.dy;
                      double x2 = tl.dx;
                      double y2 = tl.dy;
                      double x3 = tr.dx;
                      double y3 = tr.dy;
                      double x4 = bl.dx;
                      double y4 = bl.dy;
                      double x5 = br.dx;
                      double y5 = br.dy;
                      if (sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)) <
                              30 &&
                          x1 >= 0 &&
                          y1 >= 0 &&
                          x1 < width / 2 &&
                          y1 < height / 2) {
                        print(details.localPosition);
                        setState(() {
                          tl = details.localPosition;
                        });
                      } else if (sqrt((x3 - x1) * (x3 - x1) +
                                  (y3 - y1) * (y3 - y1)) <
                              30 &&
                          x1 >= width / 2 &&
                          y1 >= 0 &&
                          x1 < width &&
                          y1 < height / 2) {
                        setState(() {
                          tr = details.localPosition;
                        });
                      } else if (sqrt((x4 - x1) * (x4 - x1) +
                                  (y4 - y1) * (y4 - y1)) <
                              30 &&
                          x1 >= 0 &&
                          y1 >= height / 2 &&
                          x1 < width / 2 &&
                          y1 < height) {
                        setState(() {
                          bl = details.localPosition;
                        });
                      } else if (sqrt((x5 - x1) * (x5 - x1) +
                                  (y5 - y1) * (y5 - y1)) <
                              30 &&
                          x1 >= width / 2 &&
                          y1 >= height / 2 &&
                          x1 < width &&
                          y1 < height) {
                        setState(() {
                          br = details.localPosition;
                        });
                      }
                    },
                    child: SafeArea(
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        color: ThemeData.dark().canvasColor,
                        constraints: BoxConstraints(maxHeight: 450),
                        child: Image.file(
                          widget.file,
                          key: key,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  isFile
                      ? SafeArea(
                          child: CustomPaint(
                            painter: CropPainter(tl, tr, bl, br),
                          ),
                        )
                      : SizedBox()
                ],
              ),
              // bottomSheet()
            ],
          ),
        ));
  }

  Widget bottomSheet() {
    return Container(
      color: ThemeData.dark().canvasColor,
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Drag the handles to adjust the borders. You can",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "also do this later using the ",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Icon(
                  Icons.crop,
                  color: Colors.white,
                ),
                Text(
                  " tool.",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    "Retake",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.4), fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                    ),
                    child: isLoading
                        ? Container(
                            width: 60.0,
                            height: 20.0,
                            child: Center(
                              child: Container(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                ),
                              ),
                            ),
                          )
                        : isFile
                            ? FlatButton(
                                child: Text(
                                  "Continue",
                                  softWrap: true,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Timer(Duration(seconds: 1), () {
                                    Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) => ShowImage(
                                                  tl: tl,
                                                  tr: tr,
                                                  bl: bl,
                                                  br: br,
                                                  width: width,
                                                  height: height,
                                                  file: widget.file,
                                                  imagePixelSize:
                                                      imagePixelSize,
                                                  animatedListKey:
                                                      widget.animatedListKey,
                                                )));
                                  });
                                },
                              )
                            : Container(
                                width: 60,
                                height: 20.0,
                                child: Center(
                                    child: Container(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation(
                                              Colors.white),
                                        ))),
                              ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// import 'dart:async';
// import 'dart:io';
// import 'dart:math';
// import 'dart:typed_data';

// import 'package:documentscanner2/crop_painter.dart';
// import 'package:documentscanner2/showImage.dart';
// import 'package:documentscanner2/cropImage.dart';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_isolate/flutter_isolate.dart';
// import 'package:image_size_getter/image_size_getter.dart';

// class NewImage extends StatefulWidget {
//   File file;
//   GlobalKey<AnimatedListState> animatedListKey;
//   NewImage(this.file, this.animatedListKey);
//   _NewImageState createState() => _NewImageState();
// }

// class _NewImageState extends State<NewImage> {
//   final GlobalKey key = GlobalKey();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   double width, height;
//   int index = 0;
//   Size imagePixelSize;
//   bool isFile = false;
//   int angle = 0;
//   bool isRotating = false;
//   Offset tl, tr, bl, br;
//   double tl_x;
//   double tr_x;
//   double bl_x;
//   double br_x;
//   double tl_y;
//   double tr_y;
//   double bl_y;
//   String canvasType = "whiteboard";

//   double br_y;
//   PersistentBottomSheetController controller;

//   var whiteboardBytes;
//   var originalBytes;
//   var grayBytes;

//   bool isGrayBytes = false;
//   bool isOriginalBytes = false;
//   bool isWhiteBoardBytes = false;
//   bool isBottomOpened = false;
//   bool isLoading = false;
//   var bytes;
//   MethodChannel channel = new MethodChannel('opencv');

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer(Duration(milliseconds: 2000), getImageSize);
//   }

//   void getImageSize() {
//     RenderBox imageBox = key.currentContext.findRenderObject();
//     width = imageBox.size.width;
//     height = imageBox.size.height;
//     imagePixelSize = ImageSizGetter.getSize(widget.file);
//     tl = new Offset(20, 20);
//     tr = new Offset(width - 20, 20);
//     bl = new Offset(20, height - 20);
//     br = new Offset(width - 20, height - 20);
//     setState(() {
//       isFile = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         toolbarHeight: 50,
//         backgroundColor: Colors.green,
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.check,
//               color: Colors.white,
//             ),
//             onPressed: () async {
//               setState(() {
//                 isLoading = true;
//               });
//               Timer(Duration(seconds: 1), () {
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(
//                     builder: (context) => ShowImage(
//                           tl: tl,
//                           tr: tr,
//                           bl: bl,
//                           br: br,
//                           width: width,
//                           height: height,
//                           file: widget.file,
//                           imagePixelSize: imagePixelSize,
//                           animatedListKey: widget.animatedListKey,
//                         )));
//               });
//             },

//             // onPressed: () async {},
//           ),
//         ],
//       ),
//       key: _scaffoldKey,
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 GestureDetector(
//                   onPanDown: (details) {
//                     double x1 = details.localPosition.dx;
//                     double y1 = details.localPosition.dy;
//                     double x2 = tl.dx;
//                     double y2 = tl.dy;
//                     double x3 = tr.dx;
//                     double y3 = tr.dy;
//                     double x4 = bl.dx;
//                     double y4 = bl.dy;
//                     double x5 = br.dx;
//                     double y5 = br.dy;
//                     if (sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)) <
//                             30 &&
//                         x1 >= 0 &&
//                         y1 >= 0 &&
//                         x1 < width / 1 &&
//                         y1 < height / 1) {
//                       print("SIMMI.....${details.localPosition}");
//                       setState(() {
//                         tl = details.localPosition;
//                       });
//                     } else if (sqrt(
//                                 (x3 - x1) * (x3 - x1) + (y3 - y1) * (y3 - y1)) <
//                             30 &&
//                         x1 >= width / 2 &&
//                         y1 >= 0 &&
//                         x1 < width &&
//                         y1 < height / 2) {
//                       setState(() {
//                         tr = details.localPosition;
//                       });
//                     } else if (sqrt(
//                                 (x4 - x1) * (x4 - x1) + (y4 - y1) * (y4 - y1)) <
//                             30 &&
//                         x1 >= 0 &&
//                         y1 >= height / 2 &&
//                         x1 < width / 2 &&
//                         y1 < height) {
//                       setState(() {
//                         bl = details.localPosition;
//                       });
//                     } else if (sqrt(
//                                 (x5 - x1) * (x5 - x1) + (y5 - y1) * (y5 - y1)) <
//                             30 &&
//                         x1 >= width / 2 &&
//                         y1 >= height / 2 &&
//                         x1 < width &&
//                         y1 < height) {
//                       setState(() {
//                         br = details.localPosition;
//                       });
//                     }
//                   },
//                   onPanUpdate: (details) {
//                     double x1 = details.localPosition.dx;
//                     double y1 = details.localPosition.dy;
//                     double x2 = tl.dx;
//                     double y2 = tl.dy;
//                     double x3 = tr.dx;
//                     double y3 = tr.dy;
//                     double x4 = bl.dx;
//                     double y4 = bl.dy;
//                     double x5 = br.dx;
//                     double y5 = br.dy;
//                     if (sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)) <
//                             30 &&
//                         x1 >= 0 &&
//                         y1 >= 0 &&
//                         x1 < width / 2 &&
//                         y1 < height / 2) {
//                       print(details.localPosition);
//                       setState(() {
//                         tl = details.localPosition;
//                       });
//                     } else if (sqrt(
//                                 (x3 - x1) * (x3 - x1) + (y3 - y1) * (y3 - y1)) <
//                             30 &&
//                         x1 >= width / 2 &&
//                         y1 >= 0 &&
//                         x1 < width &&
//                         y1 < height / 2) {
//                       setState(() {
//                         tr = details.localPosition;
//                       });
//                     } else if (sqrt(
//                                 (x4 - x1) * (x4 - x1) + (y4 - y1) * (y4 - y1)) <
//                             30 &&
//                         x1 >= 0 &&
//                         y1 >= height / 2 &&
//                         x1 < width / 2 &&
//                         y1 < height) {
//                       setState(() {
//                         bl = details.localPosition;
//                       });
//                     } else if (sqrt(
//                                 (x5 - x1) * (x5 - x1) + (y5 - y1) * (y5 - y1)) <
//                             30 &&
//                         x1 >= width / 2 &&
//                         y1 >= height / 2 &&
//                         x1 < width &&
//                         y1 < height) {
//                       setState(() {
//                         br = details.localPosition;
//                       });
//                     }
//                   },
//                   child: SafeArea(
//                     child: Container(
//                       margin: EdgeInsets.only(top: 30),
//                       color: ThemeData.dark().canvasColor,
//                       constraints: BoxConstraints(maxHeight: 450),
//                       child: Image.file(
//                         widget.file,
//                         key: key,
//                       ),
//                     ),
//                   ),
//                 ),
//                 isFile
//                     ? SafeArea(
//                         child: CustomPaint(
//                           painter: CropPainter(tl, tr, bl, br),
//                         ),
//                       )
//                     : SizedBox()
//               ],
//             ),
//             // bottomSheet()
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: index,
//         selectedItemColor: Colors.black,
//         onTap: (index) async {
//           if (index == 0) {
//             if (isBottomOpened) {
//               isBottomOpened = false;
//               Navigator.of(context).pop();
//             }
//             setState(() {
//               isRotating = true;
//             });
//             Timer(Duration(seconds: 1), () async {
//               bytes = await channel.invokeMethod('rotate', {"bytes": bytes});
//             });

//             Timer(Duration(seconds: 4), () async {
//               if (angle == 360) {
//                 angle = 0;
//               }
//               angle = angle + 90;
//               bytes = await channel
//                   .invokeMethod('rotateCompleted', {"bytes": bytes});
//               setState(() {
//                 isRotating = false;
//               });
//             });
//           }
//           if (index == 1) {
//             if (isBottomOpened) {
//               isBottomOpened = false;
//               Navigator.of(context).pop();
//             }
//             Navigator.of(context)
//                 .push(MaterialPageRoute(
//               builder: (context) => CropImage(widget.file),
//             ))
//                 .then((value) {
//               if (value != null) {
//                 tl_x = value[1];
//                 tl_y = value[2];
//                 tr_x = value[3];
//                 tr_y = value[4];
//                 bl_x = value[5];
//                 bl_y = value[6];
//                 br_x = value[7];
//                 br_y = value[8];
//                 setState(() {
//                   bytes = value[0];
//                   isGrayBytes = false;
//                   isOriginalBytes = false;
//                   isWhiteBoardBytes = false;
//                 });
//               }
//             });
//           }
//           if (index == 2) {
//             if (isBottomOpened) {
//               Navigator.of(context).pop();
//               isBottomOpened = false;
//             } else {
//               isBottomOpened = true;
//               BottomSheet bottomSheet = BottomSheet(
//                 onClosing: () {},
//                 builder: (context) => colorBottomSheet(),
//                 enableDrag: true,
//               );
//               controller = _scaffoldKey.currentState
//                   .showBottomSheet((context) => bottomSheet);
//             }
//           }
//         },
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.rotate_right,
//                 color: Colors.black,
//               ),
//               title: Text("Rotate")),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.crop,
//                 color: Colors.black,
//               ),
//               title: Text("Crop")),
//           BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.color_lens,
//                 color: Colors.black,
//               ),
//               title: Text("Color")),
//         ],
//       ),
//     );
//   }

//   Widget bottomSheet() {
//     return Container(
//       color: ThemeData.dark().canvasColor,
//       width: MediaQuery.of(context).size.width,
//       height: 120,
//       child: Center(
//         child: Column(
//           children: <Widget>[
//             Text(
//               "Drag the handles to adjust the borders. You can",
//               style: TextStyle(color: Colors.white, fontSize: 18),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   "also do this later using the ",
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 ),
//                 Icon(
//                   Icons.crop,
//                   color: Colors.white,
//                 ),
//                 Text(
//                   " tool.",
//                   style: TextStyle(color: Colors.white, fontSize: 18),
//                 )
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: <Widget>[
//                 FlatButton(
//                   child: Text(
//                     "Retake",
//                     style: TextStyle(
//                         color: Colors.white.withOpacity(0.4), fontSize: 18),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: 100,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30),
//                       color: Colors.blue,
//                     ),
//                     child: isLoading
//                         ? Container(
//                             width: 60.0,
//                             height: 20.0,
//                             child: Center(
//                               child: Container(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   valueColor:
//                                       AlwaysStoppedAnimation(Colors.white),
//                                 ),
//                               ),
//                             ),
//                           )
//                         : isFile
//                             ? FlatButton(
//                                 child: Text(
//                                   "Continue",
//                                   softWrap: true,
//                                   style: TextStyle(
//                                       color: Colors.white, fontSize: 18),
//                                 ),
//                                 onPressed: () async {
//                                   setState(() {
//                                     isLoading = true;
//                                   });
//                                   Timer(Duration(seconds: 1), () {
//                                     Navigator.of(context)
//                                         .pushReplacement(MaterialPageRoute(
//                                             builder: (context) => ShowImage(
//                                                   tl: tl,
//                                                   tr: tr,
//                                                   bl: bl,
//                                                   br: br,
//                                                   width: width,
//                                                   height: height,
//                                                   file: widget.file,
//                                                   imagePixelSize:
//                                                       imagePixelSize,
//                                                   animatedListKey:
//                                                       widget.animatedListKey,
//                                                 )));
//                                   });
//                                 },
//                               )
//                             : Container(
//                                 width: 60,
//                                 height: 20.0,
//                                 child: Center(
//                                     child: Container(
//                                         height: 20,
//                                         width: 20,
//                                         child: CircularProgressIndicator(
//                                           strokeWidth: 2,
//                                           valueColor: AlwaysStoppedAnimation(
//                                               Colors.white),
//                                         ))),
//                               ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget colorBottomSheet() {
//     if (isOriginalBytes == false) {
//       grayandoriginal();
//     }
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           GestureDetector(
//             onTap: () {
//               if (originalBytes != null) {
//                 print("original");
//                 Navigator.of(context).pop();
//                 isBottomOpened = false;
//                 canvasType = "original";
//                 Timer(Duration(milliseconds: 500), () {
//                   angle = 0;
//                   setState(() {
//                     bytes = originalBytes;
//                   });
//                 });
//               }
//             },
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Container(
//                     width: 80,
//                     margin: EdgeInsets.all(10),
//                     decoration:
//                         BoxDecoration(border: Border.all(color: Colors.grey)),
//                     child: isOriginalBytes
//                         ? Image.memory(
//                             originalBytes,
//                             fit: BoxFit.fill,
//                             height: 120,
//                           )
//                         : Container(
//                             height: 120,
//                             child: Center(
//                               child: Container(
//                                   width: 20,
//                                   height: 20,
//                                   child: CircularProgressIndicator(
//                                     strokeWidth: 2,
//                                     valueColor:
//                                         AlwaysStoppedAnimation(Colors.black),
//                                   )),
//                             ),
//                           )),
//                 Text("Original"),
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               print("whiteboard");
//               Navigator.of(context).pop();
//               isBottomOpened = false;
//               angle = 0;
//               canvasType = "whiteboard";
//               Timer(Duration(milliseconds: 500), () {
//                 setState(() {
//                   bytes = whiteboardBytes;
//                 });
//               });
//             },
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Container(
//                   width: 80,
//                   margin: EdgeInsets.all(10),
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.grey)),
//                   child: isWhiteBoardBytes
//                       ? Image.memory(
//                           whiteboardBytes,
//                           fit: BoxFit.fill,
//                           height: 120,
//                         )
//                       : Container(
//                           height: 120,
//                           child: Center(
//                             child: Container(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   valueColor:
//                                       AlwaysStoppedAnimation(Colors.black),
//                                 )),
//                           ),
//                         ),
//                 ),
//                 Text("Whiteboard"),
//               ],
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               print("gray");
//               Navigator.of(context).pop();
//               isBottomOpened = false;
//               angle = 0;
//               canvasType = "gray";
//               Timer(Duration(milliseconds: 500), () {
//                 setState(() {
//                   bytes = grayBytes;
//                 });
//               });
//             },
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Container(
//                   width: 80,
//                   margin: EdgeInsets.all(10),
//                   decoration:
//                       BoxDecoration(border: Border.all(color: Colors.grey)),
//                   child: isGrayBytes
//                       ? Image.memory(
//                           grayBytes,
//                           fit: BoxFit.fill,
//                           height: 120,
//                         )
//                       : Container(
//                           height: 120,
//                           child: Center(
//                             child: Container(
//                                 width: 20,
//                                 height: 20,
//                                 child: CircularProgressIndicator(
//                                   strokeWidth: 2,
//                                   valueColor:
//                                       AlwaysStoppedAnimation(Colors.black),
//                                 )),
//                           ),
//                         ),
//                 ),
//                 Text("Grayscale"),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Future<void> grayandoriginal() async {
//     Future.delayed(Duration(seconds: 1), () {
//       channel.invokeMethod('gray', {
//         'filePath': widget.file.path,
//         'tl_x': tl_x,
//         'tl_y': tl_y,
//         'tr_x': tr_x,
//         'tr_y': tr_y,
//         'bl_x': bl_x,
//         'bl_y': bl_y,
//         'br_x': br_x,
//         'br_y': br_y,
//       });
//       channel.invokeMethod('whiteboard', {
//         'filePath': widget.file.path,
//         'tl_x': tl_x,
//         'tl_y': tl_y,
//         'tr_x': tr_x,
//         'tr_y': tr_y,
//         'bl_x': bl_x,
//         'bl_y': bl_y,
//         'br_x': br_x,
//         'br_y': br_y,
//       });
//       channel.invokeMethod('original', {
//         'filePath': widget.file.path,
//         'tl_x': tl_x,
//         'tl_y': tl_y,
//         'tr_x': tr_x,
//         'tr_y': tr_y,
//         'bl_x': bl_x,
//         'bl_y': bl_y,
//         'br_x': br_x,
//         'br_y': br_y,
//       });
//     });
//     Timer(Duration(seconds: 7), () {
//       print("this started");
//       channel.invokeMethod('grayCompleted').then((value) {
//         grayBytes = value;
//         isGrayBytes = true;
//       });
//       channel.invokeMethod('whiteboardCompleted').then((value) {
//         whiteboardBytes = value;
//         isWhiteBoardBytes = true;
//       });
//       channel.invokeMethod('originalCompleted').then((value) {
//         originalBytes = value;
//         isOriginalBytes = true;
//         if (isBottomOpened) {
//           Navigator.pop(context);
//           BottomSheet bottomSheet = BottomSheet(
//             onClosing: () {},
//             builder: (context) => colorBottomSheet(),
//             enableDrag: true,
//           );
//           controller = _scaffoldKey.currentState
//               .showBottomSheet((context) => bottomSheet);
//         }
//       });
//     });
//   }
// }
