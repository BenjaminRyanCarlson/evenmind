import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class journalData {
  String title;
  String body;
  DateTime date;
  String journalEntry;
  String journalTitle;
  String documentId;
  String journals;

  journalData(this.title, this.body, this.date);

  Map<String, dynamic> toJson() => {
        'title': title,
        'body': body,
        'date': date,
        'journalEntry': journalEntry
      };

  journalData.fromSnapshot(DocumentSnapshot snapshot)
      : title = snapshot['title'],
        body = snapshot['body'],
        date = snapshot['date'],
        journalEntry = snapshot['journalEntry'],
        journalTitle = snapshot['journalTitle'],
        journals = snapshot['journals'],
        documentId = snapshot.documentID;
}
