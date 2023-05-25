import 'dart:async';
import 'dart:convert';
import 'package:app_books/model/book.dart';
import 'package:http/http.dart' as http;

class BookService {
  static const baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  static Future<List<Book>> searchBooks(String query) async {
    final url = Uri.parse('$baseUrl?q=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final jsonList = (jsonMap['items'] as List<dynamic>?) ?? [];
      final books = jsonList.map((jsonBook) {
        final volumeInfo = jsonBook['volumeInfo'];
        final saleInfo = jsonBook['saleInfo'];

        final purchaseLinks = saleInfo != null && saleInfo['buyLink'] != null
        ? [saleInfo['buyLink']]?.cast<String>()
        : null;

        return Book(
        id: jsonBook['id'],
        title: volumeInfo['title'],
        author: (volumeInfo['authors'] as List<dynamic>).join(', '),
        purchaseLinks: purchaseLinks,
        );
      }).toList();

      return books;
    } else {
      throw Exception('Failed to search books: ${response.statusCode}');
    }
  }
}