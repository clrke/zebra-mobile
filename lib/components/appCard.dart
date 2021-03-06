import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/components/profileIcon.dart';
import 'appButton.dart';

class AppCard extends StatelessWidget {
  final String surgeonId;
  final String postTime;
  final String postCaption;
  final String posteriorPhoto;
  final String anteriorPhoto;

  AppCard({
    @required this.surgeonId,
    @required this.postTime,
    @required this.postCaption,
    @required this.posteriorPhoto,
    @required this.anteriorPhoto
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final fontSize = height * 0.025;

    return Card(
      margin: EdgeInsets.all(height * 0.01),
      elevation: 0.0,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: ProfileIcon(),
            title: Text(
              'ID $surgeonId',
              style: TextStyle(
                color: theme['secondary'],
                fontSize: fontSize * .9,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              postTime,
              style: TextStyle(
                color: theme['secondary'],
                fontSize: fontSize * .7,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: height * 0.02, vertical: 0.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: theme['secondary'],
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Text(
                postCaption,
                style: TextStyle(
                  color: Colors.grey[800],
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          posteriorPhoto !=null ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[600],
                width: 5.0,
              ),
            ),
            child: Image.network(
              '$posteriorPhoto',
              width: width * .75,
              fit: BoxFit.fitWidth,
            ),
          ) : Container(),
          SizedBox(height: 20,),
          anteriorPhoto != null ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[600],
                width: 5.0,
              ),
            ),
            child: Image.network(
              '$anteriorPhoto',
              width: width * .75,
              fit: BoxFit.fitWidth,
            ),
          ) :  Container(),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, height * 0.01),
            child: AppButton(
              onPressed: (){},
              text: 'Vote',
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.1,
                  vertical: height * 0.015
              ),
            ),
          ),
          Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}