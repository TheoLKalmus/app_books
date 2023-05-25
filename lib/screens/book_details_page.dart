import 'package:flutter/material.dart';
import '../model/book.dart';
import '../widgets/book_details.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;
  final Function(Book) onFavoriteToggle;

  BookDetailsPage(this.book, this.onFavoriteToggle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BookDetails(book, onFavoriteToggle),
      ),
    );
  }
}