import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/appButton.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/providers/HomeProvider.dart';
import 'package:zero_mobile/providers/PollProvider.dart';
import 'package:zero_mobile/screens/post.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  bool item1 = false;
  bool item2 = false;
  bool item3 = false;
  List<String> checkList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;
    final headerFontSize = height * 0.025;
    final listFontSize = height * 0.02;

      return Provider.of<PollProvider>(context,listen: false).checkList.isEmpty ? Container(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('To Surgeon:',
                style: TextStyle(
                    color: theme['primary'],
                    fontSize: headerFontSize,
                    fontWeight: FontWeight.w800
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                width: width,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Checkbox(
                          value : item1,
                          onChanged: (value){
                            if(!item1) {
                              checkList.add("Are all the important landmarks identified?");
                            } else {
                              checkList.remove("Are all the important landmarks identified?");
                            }
                            setState(() {
                              item1 =!item1;
                            });
                          }
                      ),
                      Text(
                        'Are all the important landmarks identified?',
                        style: TextStyle(
                            color: theme['primary'],
                            fontSize: listFontSize,
                            fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: width,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Checkbox(
                          value : item2,
                          onChanged: (value){
                            if(!item2) {
                              checkList.add("Are the criteria of Critical View of Safety in doublet view achieved?");
                            } else {
                              checkList.remove("Are the criteria of Critical View of Safety in doublet view achieved?");
                            }
                            setState(() {
                              item2 =!item2;
                            });
                          }
                      ),
                      SizedBox(
                        width: width * 0.80,
                        child: Text(
                          'Are the criteria of Critical View of Safety in doublet view achieved?',
                          style: TextStyle(
                              color: theme['primary'],
                              fontSize: listFontSize,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Text('To Surgical Assist/Team:',
                style: TextStyle(
                    color: theme['primary'],
                    fontSize: headerFontSize,
                    fontWeight: FontWeight.w800
                ),
              ),
              Container(
                width: width,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Checkbox(
                          value : item3,
                          onChanged: (value){
                            if(!item2) {
                              checkList.add("Do you agree that it is the cystic duct?");
                            } else {
                              checkList.remove("Do you agree that it is the cystic duct?");
                            }
                            setState(() {
                              item3 =!item3;
                            });
                          }
                      ),
                      Text(
                        'Do you agree that it is the cystic duct?',
                        style: TextStyle(
                            color: theme['primary'],
                            fontSize: listFontSize,
                            fontWeight: FontWeight.w700
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Center(
                child: AppButton(
                    onPressed: (){
                      if(checkList.isNotEmpty) {
                        Provider.of<PollProvider>(context,listen: false).addChecklist(checklist: checkList);
                        Navigator.pushReplacementNamed(context, '/post');
                      }
                    },
                    text: 'Submit',
                    padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 32.0)
                ),
              )
            ],
          ),
        ),
      ) : Post();
  }
}
