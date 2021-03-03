import 'package:flutter/material.dart';
import 'package:zero_mobile/components/formWidgets/customPostField.dart';
import 'package:zero_mobile/components/functions/profileIcon.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            ProfileIcon(),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'ID083820802',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),

                          ],
                        ),

                        SizedBox(height: 20.0),
                        CustomPostField(hintText: 'Ask your co-surgeons...'),

                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              child: Text(
                                'Take Photo',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                primary: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () {},
                            ),

                            ElevatedButton(
                              child: Text(
                                'Upload Photo',
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  side: BorderSide(color: Colors.redAccent),
                                ),
                              ),
                              onPressed: () {},
                            ),

                          ],
                        ),
                      ],

                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
