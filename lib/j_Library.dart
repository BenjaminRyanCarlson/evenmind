import 'dart:convert';

import 'package:evenmind/edit_journal.dart';
import 'package:evenmind/widgets/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:evenmind/models/journal_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class j_Library extends StatelessWidget {
  final db = Firestore.instance;
  journalData jData;
  List<journalData> journalList = <journalData>[
    journalData("New Entry", "What are you grateful for?", DateTime.now())
  ];

  j_Library(this.jData, this.journalList);

//  StreamBuilder<QuerySnapshot>(
//  stream: db.collection('journalData').snapshots(),
//  builder: (context, snapshot) {
//  if (snapshot.hasData) {
//  final journalText = snapshot.data.documents;
//  List<Text> jTextWidgets = [];
//  for (var journalBody in journalText) {
//  final body = journalBody.data['body'];
//
//  final jTextWidget = Text('$body');
//  jTextWidgets.add(jTextWidget);
//  }
//  return Column(
//  children: jTextWidgets,
//  );
//  }
//  },
//  ),

//   void journalTextStream() async {
//    await for (var snapshot in db.collection('journalData').snapshots()) {
//      for (var journalText in snapshot.documents) {
//        final body = journalText.data['body'];
//        print(body);
////        journal.insert(1, body);
////        journalList.add(body);
//        notesCard(body, 1);
//      }
//
//    }
//
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: implement build
      backgroundColor: Colors.blueGrey,
      body: Container(
          child: Column(children: <Widget>[
        newEntry(context),
        Expanded(
            child: new ListView.builder(
                itemCount: journalList.length,
                itemBuilder: (BuildContext context, int index) =>
                    notesCard(context, index))),
      ])),
    );
  }

//  Stream<QuerySnapshot> getUsersJournalDataSnapshots(
//      BuildContext context) async* {
//    final uid = await Provider.of(context).auth.getCurrentUID();
//    yield* Firestore.instance
//        .collection('userData')
//        .document(uid)
//        .collection('journalData')
//        .snapshots();
//  }

  Widget notesCard(BuildContext context, int index) {
    final journal = journalList[index];
    journalData jData;

    return Row(
      children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Card(
              color: primaryColor,
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 0.0, bottom: 3.0),
                            child: Text(
                              journal.body,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            journal.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onTap: () {
//                  journalList.insert(index, jData);
//                  journalTextStream();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new EditJournal(
                              jData: new journalData(
                                  journal.title, journal.body, DateTime.now()),
                              journalList: List<journalData>())));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget newEntryCard(context) {
    journalData jData;

    return Row(
      children: <Widget>[
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.28,
          child: Padding(
            padding: const EdgeInsets.only(left: 100, right: 100),
            child: Card(
              color: Colors.orangeAccent,
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 50.0, bottom: 50.0),
                            child: Text(
                              'New Entry',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'What are you Grateful for?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new EditJournal(
                              jData: new journalData(
                                  'goooog', 'bang', DateTime.now()),
                              journalList: List<journalData>())));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget newEntry(context) {
    return Material(
      color: Colors.blueGrey,
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(
          "New Entry",
          style: TextStyle(color: Colors.blueGrey),
        ),
        color: Colors.white,
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new EditJournal(
                      jData: new journalData("", "", DateTime.now()),
                      journalList: List<journalData>())));
        },
      ),
    );
  }

//  List<Widget> setNoteText() {
//    if (jData.body == null) {
//      return [
//        Text(
//          "Click to Add",
//          style: TextStyle(color: Colors.white),
//        )
//      ];
//    } else {
//      return [Text(jData.body)];
//    }
//  }
}
