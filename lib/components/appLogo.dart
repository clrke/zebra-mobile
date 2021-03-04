import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zero_mobile/constants/theme.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      child: Column(
        children: [
          SizedBox(
            width: width * 0.70,
            height: height * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/images/bdi_logo_right.jpg',
                  width: width * 0.30,
                ),
                Image.asset(
                  'assets/images/bdi_logo_left.jpg',
                  width: width * 0.33,
                )
              ],
            ),
          ),
          Container(
            width: width,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                  child: SvgPicture.asset(
                      'assets/svgs/sun.svg',
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * 0.70,
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text('Zero Bile Duct Injury App',
                                style: TextStyle(
                                    color: theme['primary'],
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.right),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: width * 0.70,
                          child: Text(
                              'Promoting the culture of safety in cholecystectomy',
                              style: TextStyle(
                                color: theme['secondary'],
                                fontSize: height * 0.02,
                                letterSpacing: 1.0,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.right),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
