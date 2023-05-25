import 'package:app_books/model/book.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  final Function(Book) onFavoriteToggle;

  BookDetails(this.book, this.onFavoriteToggle);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          Text(book.title),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              book.author,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          if (book.purchaseLinks != null)
            ElevatedButton(
              onPressed: () {
                final url = book.purchaseLinks![0];
                _launchURL(url);
              },
              child: Text('Compre agora'),
            ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}