import 'dart:io';

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

  void addBook() {
    print('Enter the title of the book:');
    String title = stdin.readLineSync()!;
    print('Enter the author of the book:');
    String author = stdin.readLineSync()!;
    print('Enter the year of the book:');
    int year = int.parse(stdin.readLineSync()!);

    Book book = Book(title: title, author: author, year: year);
    books.add(book);
    print('Book added: $book');
  }

  void removeBook() {
    print('Enter the title of the book to remove:');
    String title = stdin.readLineSync()!;
    print('Enter the author of the book to remove:');
    String author = stdin.readLineSync()!;
    print('Enter the year of the book to remove:');
    int year = int.parse(stdin.readLineSync()!);

    Book book = Book(title: title, author: author, year: year);
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

  while (true) {
    print('Library Menu:');
    print('1. Add Book');
    print('2. Remove Book');
    print('3. Display Books');
    print('4. Exit');

    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        library.addBook();
        break;
      case 2:
        library.removeBook();
        break;
      case 3:
        library.displayBooks();
        break;
      case 4:
        print('Exiting library...');
        return;
      default:
        print('Invalid choice. Please choose a valid option.');
    }
  }
}