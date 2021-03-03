import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_mobile/components/body/appContainerBody.dart';
import 'package:zero_mobile/providers/TokenProvider.dart';
import 'package:zero_mobile/screens/login.dart';

class AppContainer extends StatefulWidget {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  @override
  void initState() {
    super.initState();
    Provider.of<TokenProvider>(context, listen: false).storeToken();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<TokenProvider,String>(
        selector: (context,data)=>data.accessToken,
        builder: (context,data,child){
          return data != null ? AppContainerBody() : Login();
        },
    );
  }
}
