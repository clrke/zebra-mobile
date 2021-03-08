import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/providers/HomeProvider.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context,data,child){
      return Container(
        child: Column(
          children: [
            Text(' i am in operation'),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, '/logout');
              data.deleteToken();
            },child: Text('Logout'),)
          ],
        ),
      );
    });
  }
}
