import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class SurgeonProfile extends StatelessWidget {
  final String pollVote;
  final String id;

  SurgeonProfile({@required this.pollVote,@required this.id});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;

    return Row(
      children: [
        Container(
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.person_sharp,
                      color: Colors.indigo.withOpacity(0.5),
                      size: height * 0.06,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.all(Radius.circular(50.0)),
                      border: Border.all(
                        color:
                        Colors.grey[500],
                        width:
                        1.5,
                      ),
                    ),
                  )
              ),
              Positioned(
                  right: 0,
                  child: Icon(
                    pollVote == "n"
                        ? Icons.cancel
                        : Icons.check_circle,
                    color: pollVote == "n"
                        ? theme['secondary']
                        : theme['primary'],
                    size: height * 0.03,
                  )
              ),
            ],
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
        Text(
          'ID${id.substring(0, 12)}',
          style: TextStyle(
              fontSize:
              height * 0.02
          ),
        )
      ],
    );
  }
}
