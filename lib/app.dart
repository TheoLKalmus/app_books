import 'package:app_books/screens/book_finder_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador de Livros',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookFinderPage(),
    );
  }
}