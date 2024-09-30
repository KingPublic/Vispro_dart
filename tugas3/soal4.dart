class Book {
  String title;
  String author;
  int year;

  Book({required this.title, required this.author, required this.year});

  @override
  String toString() {
    return '$title by $author ($year)';
  }
}

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
    print('Book added: $book');
  }

  void removeBook(Book book) {
    if (books.contains(book)) {
      books.remove(book);
      print('Book removed: $book');
    } else {
      print('Book not found in library.');
    }
  }

  void displayBooks() {
    if (books.isEmpty) {
      print('Library is empty.');
    } else {
      print('Books in library:');
      for (var book in books) {
        print(book);
      }
    }
  }
}

void main() {
  Library library = Library();

  Book book1 = Book(title: 'Banana', author: 'Ryan Lee', year: 1960);
  Book book2 = Book(title: 'Eclipse', author: 'Aryo Ben', year: 1949);
  Book book3 = Book(title: 'Bom In Bali', author: 'Fije Jon', year: 1813);

  library.displayBooks();
  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);
  library.displayBooks();
  library.removeBook(book2);
  library.displayBooks();
}