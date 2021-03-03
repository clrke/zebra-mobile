import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';

bool status = false;
String barTitle = '';

class PostAppBar extends StatefulWidget {
  PostAppBar({barTitle});

  @override
  _PostAppBarState createState() => _PostAppBarState();
}

class _PostAppBarState extends State<PostAppBar> {

    @override
    Widget build(BuildContext context) {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 5.0,
        centerTitle: true,
        title:
        Row(
          children: [
            Expanded(
              flex: 1,
              child: ElevatedButton(
                child: Text('Help'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.all(2.0),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {},
              ),
            ),

            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  '$barTitle',
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: CustomSwitch(
                activeColor: Colors.redAccent,
                value: status,
                onChanged: (value) {
                  status = value;
                },
              ),
            ),

          ],
        ),
      );
  }
}