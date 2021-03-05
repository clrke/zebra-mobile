import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zero_mobile/components/appCard.dart';

class VotingTimeline extends StatefulWidget {
  @override
  _VotingTimelineState createState() => _VotingTimelineState();
}

class _VotingTimelineState extends State<VotingTimeline> {


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: height * 0.02),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AppCard(
                    surgeonId: 'SURGEON021',
                    postTime: '25 minutes ago',
                    postCaption: 'Did we achieve a critical view of safety? Please help us decide.',
                    postImage: 'https://d3i71xaburhd42.cloudfront.net/697059a59b3953d1d604eb3821d78bfe1e65a740/2-Figure1-1.png',
                ),
                AppCard(
                  surgeonId: 'SURGEON321',
                  postTime: '33 minutes ago',
                  postCaption: 'Here is our progress on the operation. Is the critical view of safety achieved?',
                  postImage: 'https://c8g3e5x4.rocketcdn.me/wp-content/uploads/2014/09/Safe-Chole-Figure-2A-Documentation-of-the-doublet-view-anterior.png',
                ),
                AppCard(
                  surgeonId: 'SURGEON765',
                  postTime: '53 minutes ago',
                  postCaption: 'We\'re having trouble here. Help us determine if this is viable for surgery',
                  postImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2H2_j4-J5b1MweN7VfS4BU1jW4PpfZ1RWiw&usqp=CAU',
                ),
              ],
            ),
        ),
        ),
    );
  }
}
