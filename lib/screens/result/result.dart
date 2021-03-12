import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/appButton.dart';
import 'package:zero_mobile/components/loader.dart';
import 'package:zero_mobile/models/voteModel.dart';
import 'package:zero_mobile/providers/HomeProvider.dart';
import 'package:zero_mobile/repositories/pollRepository.dart';
import 'package:zero_mobile/screens/result/components/resultBody.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  double progressValue;
  double yesVote;
  double noVote;
  int countVoters = 0;
  bool loading = false;
  Future<List<Votes>> voters;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).changeTitle(title: 'Results');
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
    Future.delayed(Duration(seconds: 1),(){
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
    });
  }

  seeMoreAction(){
    Navigator.pushReplacementNamed(context, '/results/see-more');
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
                    (
                        countVoters > 0 ? ResultBody(
                            countVoters: countVoters,
                            yesVote: yesVote,
                            noVote: noVote,
                            progressValue: progressValue,
                            seeMoreAction: seeMoreAction,
                            votes: voters
                        )  : Center(
                          child: Text(
                            'No Results',
                            style: TextStyle(
                                color: Colors.redAccent.withOpacity(0.3),
                                fontSize: height * 0.05
                            ),
                          ),
                        )
                    ),
                    Center(
                      child: AppButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/checklist');
                          },
                          text: 'Proceed to Checklist',
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.05,
                              vertical: height * 0.012
                          )
                      ),
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
