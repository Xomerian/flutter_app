import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertState();
}

class _AlertState extends State<AlertPage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Incoming')),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter a Text',
                    )),
                ElevatedButton(
                  child: Text(
                    'Alert page',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text(textController.text),
                        );
                      },
                    );
                    //onPressed: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyLayout()),*/
                    //showAlertDialog(context);
                  },
                ),

              ]),
        ));
  }
}
