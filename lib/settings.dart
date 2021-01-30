import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<Settings> {
  bool _enabled;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _enabled = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.green,
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 150.9,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffF0F0F0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.15,
                  ),
                  Image.asset(
                    "lib/Model/images/cloud.png",
                    fit: BoxFit.fill,
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Turn on drive to sync documents",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xffD0D0D0),
                        decoration: TextDecoration.none,
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "Sign in / Register ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            final boxWidth = constraints.constrainWidth();
            final dashWidth = 5.0;
            final dashHeight = 1.0;
            final dashCount = (boxWidth / (1.2 * dashWidth)).floor();
            return Container(
              margin: EdgeInsets.only(top: 6),
              padding: EdgeInsets.all(6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Storage Setting",
                      style: TextStyle(fontSize: 11.2, color: Colors.green),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Auto Upload",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Text(
                                    "upload files to the drive automatically",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal)),
                              )
                            ],
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Switch(
                          value: _enabled,
                          onChanged: (bool value) {
                            setState(() {
                              _enabled = value;
                            });
                          },
                          activeThumbImage: NetworkImage(
                              'https://lists.gnu.org/archive/html/emacs-devel/2015-10/pngR9b4lzUy39.png'),
                          inactiveThumbImage: new NetworkImage(
                              'http://wolfrosch.com/_img/works/goodies/icon/vim@2x'),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),

                  /**
                   * Container 2
                   */
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Security",
                      style: TextStyle(fontSize: 11.2, color: Colors.green),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Turn on pin",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Text("Set pin to protect documents",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Switch(
                          value: _enabled,
                          onChanged: (bool value) {
                            setState(() {
                              _enabled = value;
                            });
                          },
                          activeThumbImage: NetworkImage(
                              'https://lists.gnu.org/archive/html/emacs-devel/2015-10/pngR9b4lzUy39.png'),
                          inactiveThumbImage: new NetworkImage(
                              'http://wolfrosch.com/_img/works/goodies/icon/vim@2x'),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),

                  /**
                   * Container 3
                   */
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Notifications",
                      style: TextStyle(fontSize: 11.2, color: Colors.green),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Push Notification",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Text("turnoff push notification",
                                    style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Switch(
                          value: _enabled,
                          onChanged: (bool value) {
                            setState(() {
                              _enabled = value;
                            });
                          },
                          activeThumbImage: NetworkImage(
                              'https://lists.gnu.org/archive/html/emacs-devel/2015-10/pngR9b4lzUy39.png'),
                          inactiveThumbImage: new NetworkImage(
                              'http://wolfrosch.com/_img/works/goodies/icon/vim@2x'),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),

                  /**
                   * Container 4
                   */
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 15),
                    child: Text("Terms Condition",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),

                  /**
                   * Container 5
                   */
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 15),
                    child: Text("Privacy Policy",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),

                  /**
                   * Container 6
                   */
                  Padding(
                    padding: EdgeInsets.only(
                        top: 15, left: 10, right: 10, bottom: 15),
                    child: Text("Feedback",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.green,
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    color: Colors.grey[200],
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ListTile(
//             tileColor: Colors.white,
//             // leading: Icon(Icons.settings),

//             title: Text(
//               "All Docs",
//               style: TextStyle(color: Color(0xff002C10)),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           Container(
//             // color: Colors.white.withOpacity(0.2),
//             color: Colors.grey[200],
//             width: MediaQuery.of(context).size.width,
//             height: 1,
//           ),
//           ListTile(
//             tileColor: Colors.white,
//             // leading: Icon(Icons.settings),
//             title: Text(
//               "Export as a PDF",
//               style: TextStyle(color: Color(0xff002C10)),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           Container(
//             // color: Colors.white.withOpacity(0.2),
//             color: Colors.grey[200],
//             width: MediaQuery.of(context).size.width,
//             height: 1,
//           ),
//           ListTile(
//             tileColor: Colors.white,
//             // leading: Icon(Icons.settings),
//             title: Text(
//               "Import & Export files",
//               style: TextStyle(color: Color(0xff002C10)),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           Container(
//             // color: Colors.white.withOpacity(0.2),
//             color: Colors.grey[200],
//             width: MediaQuery.of(context).size.width,
//             height: 1,
//           ),
//           ListTile(
//             tileColor: Colors.white,
//             // leading: Icon(Icons.settings),
//             title: Text(
//               "Notifications",
//               style: TextStyle(color: Color(0xff002C10)),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           Container(
//             // color: Colors.white.withOpacity(0.2),
//             color: Colors.grey[200],
//             width: MediaQuery.of(context).size.width,
//             height: 1,
//           ),
//           ListTile(
//             tileColor: Colors.white,
//             // leading: Icon(Icons.info_outline),
//             title: Text(
//               "About us",
//               style: TextStyle(color: Color(0xff002C10)),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           Container(
//             // color: Colors.white.withOpacity(0.2),
//             color: Colors.grey[200],
//             width: MediaQuery.of(context).size.width,
//             height: 1,
//           ),
//           ListTile(
//             tileColor: Colors.white,
//             // leading: Icon(Icons.settings),
//             title: Text(
//               "Settings",
//               style: TextStyle(color: Color(0xff002C10)),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => Settings()));
//             },
//           ),
//           Container(
//             // color: Colors.white.withOpacity(0.2),
//             color: Colors.grey[200],
//             width: MediaQuery.of(context).size.width,
//             height: 1,
//           ),
//           ListTile(
//             // leading: Icon(Icons.share),
//             tileColor: Colors.white,
//             title: Text(
//               "Help",
//               style: TextStyle(color: Color(0xff002C10)),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           )
