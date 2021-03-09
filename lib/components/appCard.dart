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
  final Function onPress;

  AppCard({
      this.surgeonId,
      this.postTime,
      this.postCaption,
      @required this.posteriorPhoto,
      @required this.anteriorPhoto,
      this.onPress
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final fontSize = height * 0.025;

    return Column(
      children: <Widget>[
        surgeonId !=null && postTime !=null ? Container(
          width: width * 0.78,
          padding: EdgeInsets.only(bottom: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  ProfileIcon(
                    size: width * 0.15,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ID $surgeonId',
                        style: TextStyle(
                          color: theme['secondary'],
                          fontSize: fontSize * .9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        postTime,
                        style: TextStyle(
                          color: theme['secondary'],
                          fontSize: fontSize * .8,
                          fontWeight: FontWeight.w200,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ) : Container(),
        postCaption !=null
            ? (Container(
                width: width * 0.85,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: width * 0.85,
                    margin: EdgeInsets.symmetric(horizontal: height * 0.02),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme['secondary'],
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03, vertical: height * 0.02),
                      child: Text(
                        postCaption,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ))
            : Container(),
        Padding(
          padding: anteriorPhoto == null ? EdgeInsets.symmetric(vertical: 12.0) : EdgeInsets.only(top: 12.0),
          child: anteriorPhoto != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anterior View',
                      style: TextStyle(
                          fontSize: fontSize, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[600],
                          width: 5.0,
                        ),
                      ),
                      child: Image.network(
                        '$anteriorPhoto',
                        width: width * .75,
                        height: height * 0.40,
                        fit: BoxFit.fitWidth,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: width * .75,
                            height: height * 0.40,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              : Container(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: posteriorPhoto != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Posterior View',
                      style: TextStyle(
                          fontSize: fontSize, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[600],
                          width: 5.0,
                        ),
                      ),
                      child: Image.network(
                        '$posteriorPhoto',
                        width: width * .75,
                        height: height * 0.40,
                        fit: BoxFit.fitWidth,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: width * .75,
                            height: height * 0.40,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                )
              : Container(),
        ),
        onPress !=null ? Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: AppButton(
            elevation: 10.0,
            onPressed: onPress,
            text: 'Vote',
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.1, vertical: height * 0.015),
          ),
        ) : Container(),
        surgeonId !=null ? Divider(
          height: 20,
          thickness: 5,
          indent: 20,
          endIndent: 20,
        ) : Container(),
      ],
    );
  }
}
