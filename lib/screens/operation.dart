import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:zero_mobile/components/appCard.dart';
import 'package:zero_mobile/components/loader.dart';
import 'package:zero_mobile/models/pollModel.dart';
import 'package:zero_mobile/repositories/pollRepository.dart';
import 'package:zero_mobile/utils/apiInstance.dart';

class Operation extends StatefulWidget {
  @override
  _OperationState createState() => _OperationState();
}

class _OperationState extends State<Operation> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      child: FutureBuilder(
        future: PollRepository.fetchPolls(),
        builder: (context,data){
          if(data.connectionState == ConnectionState.done) {
            var results = data.data;

            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final posted = results[index]['updated_at'];
                Jiffy postedTime = Jiffy(posted)..utc();

                return AppCard(
                  surgeonId: results[index]['surgeon'],
                  postTime: postedTime.fromNow(),
                  postCaption: results[index]['message_post'],
                  anteriorPhoto: results[index]['anterior_photo'],
                  posteriorPhoto: results[index]['posterior_photo'],
                );
              },
            );
          } else {
            return Loader(body: Container());
          }
          return null;
        },
      )
    );
  }
}


