import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/appButton.dart';
import 'package:zero_mobile/components/loader.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/models/voteModel.dart';
import 'package:zero_mobile/providers/HomeProvider.dart';
import 'package:zero_mobile/providers/VoteProvider.dart';
import 'package:zero_mobile/repositories/pollRepository.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  double progressValue;
  double yesVote;
  double noVote;
  int countVoters;
  bool loading = false;
  Future<List<Votes>> voters;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false)
          .changeTitle(title: 'Results');
      fetchVotes();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List<Votes>> getVoters() async {
    VoteModel votes = await PollRepository.fetchVotes();
    return votes.votes;
  }

  void fetchVotes() async {
    setState(() {
      loading = true;
    });
    VoteModel votes = await PollRepository.fetchVotes();
    String yes = votes.yesRatioVote.split('%')[0].split('.')[0].trim();
    String no = votes.noRatioVote.split('%')[0].trim();
    Provider.of<VoteProvider>(context, listen: false)
        .setVotes(vote: votes.votes);
    setState(() {
      progressValue = double.parse('0.$yes');
      yesVote = double.parse('$yes');
      noVote = double.parse('$no');
      voters = getVoters();
      countVoters = votes.votes.length;
    });
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenWidth;
    final height = SizeConfig.screenHeight;

    var bodyProgress = Loader(body: Container());
    var body = Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: width,
                height: height,
                padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      countVoters > 0 ? Container(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Total Number of Voters: $countVoters',
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.bold),
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
                          Container(
                            padding: EdgeInsets.only(top: 20.0, bottom: 12.0),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(12.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(200),
                                          ),
                                          color: theme['primary'],
                                        ),
                                        child: Text(
                                          '$yesVote%',
                                          style: TextStyle(
                                              fontSize: height * 0.016,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Container(
                                        width: width * 0.50,
                                        height: 10,
                                        child: LinearProgressIndicator(
                                          backgroundColor:
                                              theme['opacitySecondary'],
                                          value: progressValue,
                                          valueColor: AlwaysStoppedAnimation(
                                              theme['secondary']),
                                          semanticsLabel:
                                              'Linear progress indicator',
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(12.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(200),
                                          ),
                                          color: theme['primary'],
                                        ),
                                        child: Text(
                                          '$noVote%',
                                          style: TextStyle(
                                              fontSize: height * 0.016,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
                                    Text(
                                      'See More >',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.02),
                                    ),
                                    Expanded(
                                      child: FutureBuilder(
                                        future: voters,
                                        builder: (context, data) {
                                          if (data.connectionState ==
                                              ConnectionState.done) {
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
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                child: Stack(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  children: [
                                                                    Positioned(
                                                                        child:
                                                                            Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .person_sharp,
                                                                        color: Colors
                                                                            .indigo
                                                                            .withOpacity(0.5),
                                                                        size: height *
                                                                            0.06,
                                                                      ),
                                                                      decoration:
                                                                          new BoxDecoration(
                                                                        borderRadius: new BorderRadius
                                                                            .all(new Radius
                                                                                .circular(
                                                                            50.0)),
                                                                        border:
                                                                            new Border.all(
                                                                          color:
                                                                              Colors.grey[500],
                                                                          width:
                                                                              1.5,
                                                                        ),
                                                                      ),
                                                                    )),
                                                                    Positioned(
                                                                        right:
                                                                            0,
                                                                        child:
                                                                            Icon(
                                                                          results[index].pollVote == "n"
                                                                              ? Icons.cancel
                                                                              : Icons.check_circle,
                                                                          color: results[index].pollVote == "n"
                                                                              ? theme['secondary']
                                                                              : theme['primary'],
                                                                          size: height *
                                                                              0.03,
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: width *
                                                                    0.02,
                                                              ),
                                                              Text(
                                                                'ID${results[index].surgeon.substring(0, 12)}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        height *
                                                                            0.02),
                                                              )
                                                            ],
                                                          ),
                                                          Container(
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                    'See Labels'),
                                                                style: ElevatedButton
                                                                    .styleFrom(
                                                                  elevation:
                                                                      10.0,
                                                                  primary: theme[
                                                                      'secondary'],
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              8.0),
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          height *
                                                                              0.016,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                onPressed:
                                                                    () {},
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.02,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 12.0,
                                                                horizontal:
                                                                    12.0),
                                                        width: width,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          color: Colors.grey
                                                              .withOpacity(0.3),
                                                        ),
                                                        child: Text(
                                                            '${results[index].remarks}',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    height *
                                                                        0.02)),
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
                              ))
                        ],
                      )) : Center(
                        child: Text(
                          'No Results',
                          style: TextStyle(
                              color: Colors.redAccent.withOpacity(0.3),
                              fontSize: height * 0.05),
                        ),
                      ),
                      Center(
                        child: AppButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/checklist');
                            },
                            text: 'Proceed to Checklist',
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.05,
                                vertical: height * 0.012)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );

    return Container(child: loading ? bodyProgress : body);
  }
}
