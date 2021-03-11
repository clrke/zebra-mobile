import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/appButton.dart';
import 'package:zero_mobile/components/appCaptionField.dart';
import 'package:zero_mobile/components/appCard.dart';
import 'package:zero_mobile/components/loader.dart';
import 'package:zero_mobile/constants/theme.dart';
import 'package:zero_mobile/models/pollModel.dart';
import 'package:zero_mobile/providers/HomeProvider.dart';
import 'package:zero_mobile/providers/VoteProvider.dart';
import 'package:zero_mobile/repositories/pollRepository.dart';
import 'package:zero_mobile/repositories/voteRepository.dart';

class Vote extends StatefulWidget {
  @override
  _VoteState createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  final _remarksController = TextEditingController();
  Future<PollModel> poll;

  String selectedRadio = '';
  bool loading = false;
  String vote;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).changeTitle(title: 'Vote & Label');
      final id = Provider.of<VoteProvider>(context, listen: false).selectedPollId;
      fetchPolls(id: id);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _remarksController.dispose();
  }

  void fetchPolls({@required int id}) async {
    setState(() {
      poll = PollRepository.fetchPollsById(id: id);
    });
  }

  void actionVote() async {
    setState(() {
      loading = true;
    });

    final id = Provider.of<VoteProvider>(context, listen: false).selectedPollId;
    final String remark = _remarksController.value.text;

    await VoteRepository.surgeonVote(id: id,vote: vote,remark: remark);

    setState(() {
      loading = false;
    });

    Navigator.pushReplacementNamed(context, '/');
    Provider.of<HomeProvider>(context,listen: false).setCurrentIndex(index: 0);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final id = Provider.of<VoteProvider>(context, listen: false).selectedPollId;

    var body = Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(bottom: 20.0),
      child: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
                () {
              setState(() {
                poll = PollRepository.fetchPollsById(id: id);
              });
            },
          );
        },
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: poll,
            builder: (context, data) {
              if (data.connectionState == ConnectionState.done) {
                PollModel results = data.data;
                return Column(
                  children: [
                    AppCard(
                      anteriorPhoto: results.anteriorPhoto,
                      posteriorPhoto: results.posteriorPhoto,
                    ),
                    Container(
                      width: width * 0.75,
                      child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'Have we achieved a Critical View of Safety?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Container(
                          width: width * 0.75,
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                child: Row(
                                  children: [
                                    Radio(
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: 'y',
                                      groupValue: selectedRadio,
                                      onChanged: (value) {
                                        selectedRadio = value;
                                        setState(() {
                                          vote = 'y';
                                        });
                                      },
                                    ),
                                    Text('Yes',style: TextStyle(fontSize: height * 0.018,fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                              Container(
                                height: 20,
                                child: Row(
                                  children: [
                                    Radio(
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                      value: 'n',
                                      groupValue: selectedRadio,
                                      onChanged: (value) {
                                        selectedRadio = value;
                                        setState(() {
                                          vote = 'n';
                                        });
                                      },
                                    ),
                                    Text('No',style: TextStyle(fontSize: height * 0.018,fontWeight: FontWeight.w600),),
                                  ],
                                ),
                              ),
                              SizedBox(height: height * 0.02,),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text('Remarks',
                                  style: TextStyle(
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.01,),
                              Container(
                                child: AppCaptionField(
                                  controller: _remarksController,
                                  hintText: '',
                                  fillColor: Colors.white,
                                ),
                              ),
                              SizedBox(height: height * 0.02,),
                              AppButton(
                                  onPressed: actionVote,
                                  text: 'Submit',
                                  padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 32.0)
                              )
                            ],
                          )),
                    ),
                  ],
                );
              } else {
                return Loader(body: Container());
              }
            },
          ),
        ),
      ),
    );
    var bodyProgress = Loader(body: body);

    return Scaffold(
      resizeToAvoidBottomInset:true,
      body: Container(
          child: loading ? bodyProgress : body
      ),
    );
  }
}
