import 'package:flutter/material.dart';

import '../../constants/theme.dart';
import '../appButton.dart';
import '../appButtonOutline.dart';
import '../appCaptionField.dart';
import '../functions/appBar.dart';
import '../profileIcon.dart';

class CreatePostForm extends StatefulWidget {
  @override
  _CreatePostFormState createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {
  final _formKey = GlobalKey<FormState>();
  final _captionController = TextEditingController();

  confirmPressed() {
    print('post');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final fontSize = height * 0.025;

    return Form(
      key: _formKey,
      child: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.55,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          children: [
                            ProfileIcon(),
                            SizedBox(width: 12.0,),
                            Text(
                              'ID 1234567890',
                              style: TextStyle(
                                color: theme['secondary'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                          onPressed: (){},
                          child: Text('Post'),
                          style: ElevatedButton.styleFrom(
                            primary: theme['secondary'],
                            padding: EdgeInsets.symmetric(horizontal:27.0,vertical: 12.0),
                            elevation: 20,
                            shadowColor: Colors.black,
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: fontSize,
                            ),
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                AppCaptionField(
                  controller: _captionController,
                  onValidate: (value) {
                    if (value.isEmpty) {
                      return 'Caption is required';
                    }
                  },
                  hintText: 'Ask your co-surgeons...',
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                Container(
                  width: width,
                  padding: EdgeInsets.symmetric(horizontal:16.0),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Row(
                      children: <Widget>[
                        AppButton(
                            onPressed: confirmPressed,
                            text: 'Take a Photo',
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.06,
                                vertical: height * 0.015
                            )
                        ),
                        SizedBox(width: 20.0,),
                        AppButtonOutline(
                            onPressed: confirmPressed,
                            text: 'Upload a Photo',
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.06,
                                vertical: height * 0.015
                            )
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
