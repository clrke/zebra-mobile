import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/components/appTextField.dart';
import 'package:zero_mobile/screens/caseEntry/components/FormTextField.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class PollCase extends StatefulWidget {
  @override
  _PollCaseState createState() => _PollCaseState();
}

class _PollCaseState extends State<PollCase> {
  final _formKey = GlobalKey<FormState>();
  final _caseController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text('Case Entry Profile',style: TextStyle(fontSize: height * 0.025,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: height * 0.025,),
            Container(
                padding: EdgeInsets.only(bottom: height * 0.025),
                child: FormTextField(
                    controller: _caseController,
                    onValidate: (value){
                      if(value.isEmpty) {
                        return 'Case No is required';
                      }
                    },
                    hintText: '',
                    labelText: 'Case no',
                    obscureText: false,
                    widthSize: width,
                    paddingHorizontal: height * 0.02,
                    paddingVertical: width * 0.05
                )
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * .40,
                    padding: EdgeInsets.only(bottom: height * 0.025),
                    child: FormTextField(
                        controller: _dateController,
                        onValidate: (value){
                          if(value.isEmpty) {
                            return 'Date No is required';
                          }
                        },
                        hintText: 'mm/dd/yyyy',
                        labelText: 'Date',
                        obscureText: false,
                        widthSize: width,
                        paddingHorizontal: height * 0.02,
                        paddingVertical: width * 0.05
                    )
                ),
                Container(
                    width: width * .40,
                    padding: EdgeInsets.only(bottom: height * 0.025),
                    child: FormTextField(
                        controller: _timeController,
                        onValidate: (value){
                          if(value.isEmpty) {
                            return 'Time No is required';
                          }
                        },
                        hintText: 'hh:mm',
                        labelText: 'Time',
                        obscureText: false,
                        widthSize: width,
                        paddingHorizontal: height * 0.02,
                        paddingVertical: width * 0.05
                    )
                ),
              ],
            ),
            Container(
              child:Row(
                children: [
                  Text('Age'),
                  DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("First Item"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Second Item"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                            child: Text("Third Item"),
                            value: 3
                        ),
                        DropdownMenuItem(
                            child: Text("Fourth Item"),
                            value: 4
                        )
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

