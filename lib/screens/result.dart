import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/appButton.dart';
import 'package:zero_mobile/providers/HomeProvider.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<HomeProvider>(context,listen: false).changeTitle(title:'Results');
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child:Center(
                child: Text('No Results',style: TextStyle(color: Colors.redAccent.withOpacity(0.3),fontSize: height * 0.05),),
              )
            ),
            AppButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/checklist');
                },
                text: 'Proceed to Checklist',
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.012
                )
            ),
          ],
        ),
      ),
    );
  }
}
