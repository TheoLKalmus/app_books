class Book {
  final String id;
  final String title;
  final String author;
  final List<String>? purchaseLinks;
  bool isFavorite;

  Book({
    required this.id,
    required this.title,
    required this.author,
    this.purchaseLinks,
    this.isFavorite = false,
  })  : assert(id != null),
        assert(title != null),
        assert(author != null);

  Book copyWith({
    String? id,
    String? title,
    String? author,
    bool? isFavorite,
    List<String>? purchaseLinks,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      isFavorite: isFavorite ?? this.isFavorite,
      purchaseLinks: purchaseLinks ?? this.purchaseLinks,
    );
  }
}