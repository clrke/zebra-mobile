import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/appCard.dart';
import 'package:zero_mobile/components/loader.dart';
import 'package:zero_mobile/models/pollModel.dart';
import 'package:zero_mobile/providers/VoteProvider.dart';
import 'package:zero_mobile/repositories/pollRepository.dart';

class Operation extends StatefulWidget {
  @override
  _OperationState createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  Future <List<PollModel>> polls;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Future.delayed(Duration(seconds: 1),(){
        fetchPolls();
      });
    });
  }

  void fetchPolls() async{
    setState(() {
      polls = PollRepository.fetchPolls();
    });
  }

  voteAction(id){
    Provider.of<VoteProvider>(context,listen: false).setPollId(id:id);
    Navigator.pushReplacementNamed(context, '/vote');
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      child: FutureBuilder(
        future: polls,
        builder: (context,data){
          if(data.connectionState == ConnectionState.done) {
            List<PollModel> results = data.data;
            return RefreshIndicator(
              onRefresh: () {
                return Future.delayed(
                  Duration(seconds: 1),
                  () {
                    setState(() {
                      polls = PollRepository.fetchPolls();
                    });
                  },
                );
              },
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  final posted = results[index].updatedAt;
                  Jiffy postedTime = Jiffy(posted)..utc();
                  return AppCard(
                    surgeonId: results[index].surgeon.toString().substring(0,15),
                    postTime: postedTime.fromNow(),
                    postCaption: results[index].messagePost,
                    anteriorPhoto: results[index].anteriorPhoto,
                    posteriorPhoto: results[index].posteriorPhoto,
                    onPress: () {
                      voteAction(results[index].id);
                    },
                  );
                },
              ),
            );
          } else {
            return Loader(body: Container());
          }
        },
      )
    );
  }
}


