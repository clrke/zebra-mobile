import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zero_mobile/constants/theme.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        width: width,
        child: Column(
          children: [
            SizedBox(height: 12.0,),
            Container(
              width: width * 0.70,
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
            SizedBox(height: 12.0,),
            Container(
              width: width,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    child: SvgPicture.asset(
                        'assets/svgs/sun.svg',
                      width: height * 0.20,
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
                            width: width * 0.80,
                            child: Text(
                                'Promoting the culture of safety in laparoscopic cholecystectomy',
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
      ),
    );
  }
}
