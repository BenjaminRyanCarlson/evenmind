import 'dart:collection';
import 'dart:convert';
import 'package:evenmind/j_Library.dart';
import 'package:evenmind/widgets/provider_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:evenmind/models/journal_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evenmind/services/auth_service.dart';

final primaryColor = const Color(0xff9fb2d1);
journalData jData;
List<journalData> journalList = [];

class EditJournal extends StatefulWidget {
  journalData jData;
  List<journalData> journalList = [];

  EditJournal({Key key, @required this.jData, this.journalList})
      : super(key: key);
  @override
  _EditJournalState createState() => _EditJournalState();
}

class _EditJournalState extends State<EditJournal> {
  TextEditingController _journalController = new TextEditingController();
  TextEditingController _titleController = new TextEditingController();

  journalData journalEntry;

  final db = Firestore.instance;

  void initState() {
    super.initState();
    _titleController.text = widget.jData.title;
    _journalController.text = widget.jData.body;
  }

//  void getJournalText() async {
//    final journalText = await db.collection('journalData').getDocuments();
//    for (var journalText in journalText.documents) {
//      print(journalText.data);
//    }
//  }

//  void journalTextStream() async {
//    await for (var snapshot in db.collection('journalData').snapshots()) {
//      for (var journalText in snapshot.documents) {
//        final body = journalText.data['body'];
//        print(body);
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: primaryColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                buildHeading(context),
                buildFields(context),
                buildSave(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeading(context) {
    return Material(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text("Journal",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            FlatButton(
              child: Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildFields(context) {
    return Material(
      color: primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            controller: _titleController,
            style: Theme.of(context).textTheme.title,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 12.0, 12.0, 20.0),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'title'),
          ),
          TextField(
            controller: _journalController,
            minLines: 4,
            maxLines: null,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 12.0, 12.0, 20.0),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'What are you grateful for?'),
          ),
        ],
      ),
    );
  }

  Widget buildSave(context) {
    return Material(
      color: Colors.white,
      child: RaisedButton(
        child: Text("Save"),
        color: Colors.white,
        onPressed: () async {
          final uid = await Provider.of(context).auth.getCurrentUID();

          await db
              .collection('userData')
              .document(uid)
              .collection('journalData')
              .add({
            'userData': uid,
            'body': _journalController.text,
            'title': _titleController.text
          });

          jData = journalData(
              _journalController.text, _titleController.text, DateTime.now());
          journalList.add(jData);
          Navigator.of(context).pop();

//          getJournalText();
//          journalTextStream();
        },
      ),
    );
  }
}
