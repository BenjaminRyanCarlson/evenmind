import 'package:flutter/material.dart';

final primaryColor = const Color(0xff9fb2d1);

class Journal extends StatelessWidget {
  final _titleController = TextEditingController();
  final _journalController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  style: Theme.of(context).textTheme.title,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 12.0, 12.0, 20.0),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'title'),
                ),
                TextField(
                  controller: _journalController,
                  minLines: 4,
                  maxLines: null,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(20.0, 12.0, 12.0, 20.0),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'What are you grateful for?'),
                ),
                OutlineButton(
                  textColor: Colors.black,
                  borderSide: BorderSide(color: Colors.blue),
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ));
  }
}
