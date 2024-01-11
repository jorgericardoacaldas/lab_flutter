import 'dart:convert';

import 'package:grimorio/models/google_book.dart';

class PersonalBook {
  int? id;
  late String dayStarted;
  late String dayFinished;
  late String comments;
  late GoogleBook googleBook;

  PersonalBook({required this.dayStarted, required this.dayFinished, required this.comments, required this.googleBook, this.id});

  PersonalBook.fromMap(Map<String, dynamic> map) : id = map["id"], dayStarted = map["dayStarted"], dayFinished = map["dayFinished"], comments = map["comments"],
    googleBook = GoogleBook.fromJson(json.decode(map["googleBook"]) );

  Map<String, dynamic> toMap() {
    return {"id": id, "googleBook" : json.encode(googleBook.toMap()), "dayStarted" : dayStarted, "dayFinished" : dayFinished, "comments" : comments};
  }
}