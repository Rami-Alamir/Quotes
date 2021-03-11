import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quotes/model/quote.dart';
import 'package:http/http.dart' as http;
import 'package:quotes/sqflite/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';

class QuotesProvider with ChangeNotifier {
  Database _db;
  List<Quote> _quotesList = [];
  List<Quote> _favouriteQuotesList = [];
  bool _isLoading = false;
  final Uri _uri =
      Uri.parse("https://api.quotable.io/random?tags=inspirational");

  bool get isLoading => _isLoading;

  List<Quote> get quotesList => _quotesList;
  List<Quote> get favouriteQuotesList => _favouriteQuotesList;

  //call api
  Future<void> getQuoteData(context) async {
    _isLoading = true;
    try {
      final response = await http.get(_uri);
      if (response.statusCode == 200) {
        // print(json.decode(response.body));
        // print(response.body);
        final item = json.decode(response.body);
        Quote quote = Quote.fromJson(item);
        _quotesList.insert(0, quote);
        await addQuote();
      } else {}
    } catch (e) {}
    _isLoading = false;
    notifyListeners();
  }

  // get a reference to the database
  Future getDB(context) async {
    try {
      _db = await DatabaseHelper.instance.database;
      getQuotesFromDB();
    } catch (e) {}
  }

  // get Quotes From database
  Future<void> getQuotesFromDB() async {
    List<Map> result = await _db.rawQuery('SELECT * FROM Quotes');
    try {
      result.forEach((row) => _quotesList.add(Quote.fromMap(row)));
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  // used to add quote DB
  Future<void> addQuote() async {
    try {
      await _db.insert(
        "Quotes",
        quotesList[0].toMap(),
      );
    } catch (e) {}
  }

  // used to chang favourite status and update DB
  Future<void> updateIsFavouriteQuote(int index) async {
    _quotesList[index].isFavourite =
        (_quotesList[index].isFavourite == 0 ? 1 : 0);
    String column = "sId";
    try {
      await _db.update("Quotes", _quotesList[index].toMap(),
          where: '$column = ?', whereArgs: [_quotesList[index].sId]);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  // used to remove quote and update DB
  Future<void> removeQuote(int index) async {
    String column = "sId";
    print('${_quotesList[index].sId}');
    try {
      await _db.delete("Quotes",
          where: '$column = ?', whereArgs: [_quotesList[index].sId]);
    } catch (e) {
      print(e.toString());
    }
    _quotesList.removeAt(index);
    notifyListeners();
  }

  // get Favourite Quotes From database
  Future<void> getFavouriteQuotes() async {
    _favouriteQuotesList.clear();
    List<Map> result =
        await _db.rawQuery('SELECT * FROM Quotes WHERE isFavourite = 1');
    try {
      result.forEach((row) => _favouriteQuotesList.add(Quote.fromMap(row)));
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
