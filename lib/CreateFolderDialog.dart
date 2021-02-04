import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateFolderDialog extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;
  final void Function() onTap;
  const CreateFolderDialog(
      {Key key, this.title, this.descriptions, this.text, this.img, this.onTap})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

String foldername;

final TextEditingController textController = new TextEditingController();

class _CustomDialogBoxState extends State<CreateFolderDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: textController,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[200], width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  hintText: 'Enter folder name here',
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      _createFolder(textController.text);
                      // Navigator.of(context).pop();
                      Navigator.pop(context, textController.text);
                    },
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                child: Image.asset("assets/model.jpeg")),
          ),
        ),
      ],
    );
  }

  _createFolder(String dirName) async {
    final folderName = "Document Scanner";
    final root = Directory("storage/emulated/0/$folderName");
    String directoryPath = root.path + '/' + dirName;

    if ((await root.exists())) {
      final subPath = Directory(directoryPath);
      if (await subPath.exists()) {
      } else {
        subPath.create();
        textController.clear();
        Fluttertoast.showToast(
            msg: "Created Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      }

      print("exist");
    } else {
      print("not exist");
      root.create();
      final subPath = Directory(directoryPath);
      subPath.create();
    }
  }
}
