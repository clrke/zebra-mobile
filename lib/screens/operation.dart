import 'package:flutter/cupertino.dart';

class Operation extends StatefulWidget {
  @override
  _OperationState createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(' i am in operation'),
        ],
      ),
    );
  }
}
