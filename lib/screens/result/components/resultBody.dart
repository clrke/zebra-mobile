import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/models/voteModel.dart';
import 'package:zero_mobile/screens/result/components/resultListButton.dart';
import 'package:zero_mobile/screens/result/components/surgeonProfile.dart';
import 'package:zero_mobile/screens/result/components/votePercentage.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class ResultBody extends StatelessWidget {
  final int countVoters;
  final double yesVote;
  final double noVote;
  final double progressValue;
  final Function seeMoreAction;
  final Future votes;

  ResultBody({
    @required this.countVoters,
    @required this.yesVote,
    @required this.noVote,
    @required this.progressValue,
    @required this.seeMoreAction,
    @required this.votes
  });


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;

    return Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Total Number of Voters: $countVoters',
                style: TextStyle(
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              width: width * 0.80,
              child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Have we achieved the Critical View of Safety?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            VotePercentage(
                progressValue: progressValue,
                yesPercentage: yesVote,
                noPercentage: noVote
            ),
            Container(
              padding: EdgeInsets.only(bottom: 12.0),
              width: width * 0.75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Yes',
                    style: TextStyle(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'No',
                    style: TextStyle(
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
            Container(
                height: height * 0.60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  color: Colors.transparent,
                ),
                width: width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: seeMoreAction,
                        child: Text(
                          'See More >',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.02,
                              color: Colors.black
                          ),
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder(
                          future: votes,
                          builder: (context, data) {
                            if (data.connectionState == ConnectionState.done) {
                              List<Votes> results = data.data;
                              return ListView.builder(
                                itemCount: results.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.only(
                                        bottom: 20.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SurgeonProfile(
                                                pollVote: results[index].pollVote,
                                                id: results[index].surgeon
                                            ),
                                            ResultListButton(
                                                buttonLabel: 'See Labels',
                                                elevationValue: 10.0,
                                                padding: EdgeInsets.symmetric(horizontal: 8.0)
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                                          width: width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.0),
                                            color: Colors.grey.withOpacity(0.3),
                                          ),
                                          child: Text(
                                              '${results[index].remarks}',
                                              style: TextStyle(
                                                  fontSize: height * 0.02
                                              )
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                )
            )
          ],
        )
    );
  }
}
