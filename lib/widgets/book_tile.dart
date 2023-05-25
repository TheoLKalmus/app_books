import 'package:app_books/model/book.dart';
import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  final Book book;
  final Function(Book) onTap;
  final Function(Book) onFavoriteToggle;

  BookTile({
    required this.book,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      subtitle: Text(book.author),
      trailing: IconButton(
        icon: Icon(
          book.isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () => onFavoriteToggle(book),
      ),
      onTap: () => onTap(book),
    );
  }
}