import 'package:flutter/material.dart';

import '../model/book.dart';
import '../services/book_service.dart';
import '../widgets/book_tile.dart';
import 'book_details_page.dart';

class BookFinderPage extends StatefulWidget {
  @override
  _BookFinderPageState createState() => _BookFinderPageState();
}

class _BookFinderPageState extends State<BookFinderPage> {
  late TextEditingController _searchController;
  List<Book> _books = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _searchBooks(String query) async {
    setState(() {
      _isLoading = true;
    });

    final books = await BookService.searchBooks(query);

    setState(() {
      _books = books;
      _isLoading = false;
    });
  }

  void _toggleFavorite(Book book) {
    setState(() {
      book.isFavorite = !book.isFavorite;
    });
  }

  void _navigateToDetailsPage(Book book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BookDetailsPage(book, _toggleFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Finder'),
        leading: Icon(Icons.book),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Busque seu livro',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final query = _searchController.text.trim();
              if (query.isNotEmpty) {
                _searchBooks(query);
              }
            },
            child: Text('Buscar'),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _books.isEmpty
                ? Center(child: Text('Nenhum livro foi encontrado'))
                : ListView.builder(
              itemCount: _books.length,
              itemBuilder: (context, index) {
                final book = _books[index];
                return BookTile(
                  book: book,
                  onTap: _navigateToDetailsPage,
                  onFavoriteToggle: _toggleFavorite,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}