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
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Moving to next screen...')));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final fontSize = height * 0.025;

    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  children: [
                    ProfileIcon(),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.05,
                          bottom: height * 0.01,
                          top: height * 0.01),
                      child: Text(
                        'ID 1234567890',
                        style: TextStyle(
                          fontSize: fontSize,
                          color: theme['secondary'],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
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
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                   AppButton(
                       onPressed: confirmPressed,
                       text: 'Take Photo',
                       padding: EdgeInsets.symmetric(
                           horizontal: width * 0.06,
                           vertical: height * 0.02
                       )
                   ),
                   AppButtonOutline(
                        onPressed: confirmPressed,
                        text: 'Upload Photo',
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.06,
                            vertical: height * 0.02
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
