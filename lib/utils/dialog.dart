import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class Dialogs {
  static Future dialog(BuildContext context, String text) async {
    SizeConfig().init(context);
    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;
    final fontSize = height * 0.02;

    final dialog = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Container(
              width: width,
              padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.red,
                    size: fontSize,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontSize: fontSize),
                  )
                ],
              ),
            ),
          );
        });
    return dialog;
  }

  static confirmationDialog({
      @required BuildContext context,
      @required String content,
      @required String title,
      @required Function yesAction,
      @required Function noAction
  }) async {

    SizeConfig().init(context);
    final height = SizeConfig.screenHeight;
    final fontSize = height * 0.02;

    final dialog = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actions: [
              ElevatedButton(
                child: Text("Yes"),
                onPressed: () {
                  yesAction();
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text("No"),
                onPressed: () {
                  noAction();
                  Navigator.of(context).pop();
                },
              ),
            ],
            title: Text('$title',style: TextStyle(fontSize: fontSize),),
            content: Text('$content',style: TextStyle(fontSize: fontSize),),
          );
        });

    return dialog;
  }
}
