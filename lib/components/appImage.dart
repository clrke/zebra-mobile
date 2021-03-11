import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class AppImage extends StatelessWidget {
  final photo;
  final title;

  AppImage({@required this.photo,@required this.title});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenHeight;
    final height = SizeConfig.screenHeight;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title',
            style: TextStyle(
                fontSize: height * 0.02, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[600],
                width: 5.0,
              ),
            ),
            child: Image.network(
              '$photo',
              width: width * .75,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
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
      ),
    );
  }
}
