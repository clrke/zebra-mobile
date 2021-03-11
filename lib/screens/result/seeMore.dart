import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/components/appImage.dart';
import 'package:zero_mobile/components/loader.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/models/voteModel.dart';
import 'package:zero_mobile/repositories/pollRepository.dart';
import 'package:zero_mobile/screens/result/components/resultListButton.dart';
import 'package:zero_mobile/screens/result/components/surgeonProfile.dart';
import 'package:zero_mobile/utils/sizeConfig.dart';

class SeeMoreResults extends StatefulWidget {
  @override
  _SeeMoreResultsState createState() => _SeeMoreResultsState();
}

class _SeeMoreResultsState extends State<SeeMoreResults> {
  String anteriorPhoto;
  String posteriorPhoto;
  Future<List<Votes>> voters;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchVotes();
    });
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

    Future.delayed(Duration(seconds: 1),(){
      setState(() {
        anteriorPhoto = votes.anteriorPhoto;
        posteriorPhoto = votes.posteriorPhoto;
        voters = getVoters();
      });

      setState(() {
        loading = false;
      });
    });
  }

  goBackAction(){
    Navigator.pushReplacementNamed(context, '/results');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final width = SizeConfig.screenHeight;
    final height = SizeConfig.screenHeight;

    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: goBackAction,
                focusColor: Colors.white,
                highlightColor: Colors.white,
                splashColor: Colors.white,
            ),
            Expanded(
              child: FutureBuilder(
                future: voters,
                builder: (context, data) {
                  if (data.connectionState == ConnectionState.done) {
                    List<Votes> results = data.data;
                    return ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 30.0,horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: results[index].pollVote == 'y' ? Colors.grey.withOpacity(0.4) :Colors.red.withOpacity(0.3),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 4,// changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 24.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SurgeonProfile(
                                      pollVote: results[index].pollVote,
                                      id: '${results[index].surgeon}'
                                  ),
                                  ResultListButton(
                                    buttonLabel: results[index].pollVote == 'y' ? 'Yes' : 'No',
                                    elevationValue: 0.0,
                                    padding: EdgeInsets.symmetric(vertical: 16.0),
                                    vote: results[index].pollVote,
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0,),
                              AppImage(
                                  photo: anteriorPhoto,
                                  title: 'Anterior View'
                              ),
                              SizedBox(height: 20.0,),
                              AppImage(
                                  photo: posteriorPhoto,
                                  title: 'Posterior View'
                              ),
                              SizedBox(height: 20.0,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Remarks',
                                    style: TextStyle(
                                        fontSize: height * 0.02,
                                        fontWeight: FontWeight.bold,
                                        color: theme['secondary']
                                    ),
                                  ),
                                  SizedBox(height: 12.0,),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white.withOpacity(0.65),
                                    ),
                                    child: Text(
                                        '${results[index].remarks}',
                                        style: TextStyle(
                                            fontSize: height * 0.02
                                        )
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Loader(body: Container());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

