import 'package:documentscanner2/settings.dart';
import 'package:flutter/material.dart';

class DocDrawer extends StatelessWidget {
  final double height;

  const DocDrawer({this.height = 1});

  @override
  Widget build(BuildContext context) {
    // return Container(
    return Column(
      children: <Widget>[
        Container(
          height: 165.9,
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
          final dashHeight = height;
          final dashCount = (boxWidth / (1.2 * dashWidth)).floor();

          return Flex(
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: dashHeight,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Color(0xffDCDCDC)),
                ),
              );
            }),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        }),
        ListTile(
          tileColor: Colors.white,
          // leading: Icon(Icons.settings),

          title: Text(
            "All Docs",
            style: TextStyle(color: Color(0xff002C10)),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Container(
          // color: Colors.white.withOpacity(0.2),
          color: Colors.grey[200],
          width: MediaQuery.of(context).size.width,
          height: 1,
        ),
        ListTile(
          tileColor: Colors.white,
          // leading: Icon(Icons.settings),
          title: Text(
            "Export as a PDF",
            style: TextStyle(color: Color(0xff002C10)),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Container(
          // color: Colors.white.withOpacity(0.2),
          color: Colors.grey[200],
          width: MediaQuery.of(context).size.width,
          height: 1,
        ),
        ListTile(
          tileColor: Colors.white,
          // leading: Icon(Icons.settings),
          title: Text(
            "Import & Export files",
            style: TextStyle(color: Color(0xff002C10)),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Container(
          // color: Colors.white.withOpacity(0.2),
          color: Colors.grey[200],
          width: MediaQuery.of(context).size.width,
          height: 1,
        ),
        ListTile(
          tileColor: Colors.white,
          // leading: Icon(Icons.settings),
          title: Text(
            "Notifications",
            style: TextStyle(color: Color(0xff002C10)),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Container(
          // color: Colors.white.withOpacity(0.2),
          color: Colors.grey[200],
          width: MediaQuery.of(context).size.width,
          height: 1,
        ),
        ListTile(
          tileColor: Colors.white,
          // leading: Icon(Icons.info_outline),
          title: Text(
            "About us",
            style: TextStyle(color: Color(0xff002C10)),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Container(
          // color: Colors.white.withOpacity(0.2),
          color: Colors.grey[200],
          width: MediaQuery.of(context).size.width,
          height: 1,
        ),
        ListTile(
          tileColor: Colors.white,
          // leading: Icon(Icons.settings),
          title: Text(
            "Settings",
            style: TextStyle(color: Color(0xff002C10)),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Settings()));
          },
        ),
        Container(
          // color: Colors.white.withOpacity(0.2),
          color: Colors.grey[200],
          width: MediaQuery.of(context).size.width,
          height: 1,
        ),
        ListTile(
          // leading: Icon(Icons.share),
          tileColor: Colors.white,
          title: Text(
            "Help",
            style: TextStyle(color: Color(0xff002C10)),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
