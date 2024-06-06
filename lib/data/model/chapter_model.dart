class Chapter {
  int? id;
  int chapterId;
  int bookId;
  String title;
  int number;
  String hadisRange;
  String bookName;

  Chapter({
     this.id,
    required this.chapterId,
    required this.bookId,
    required this.title,
    required this.number,
    required this.hadisRange,
    required this.bookName,
  });

  Chapter.fromMap(Map<String, dynamic> json) :
    id = json['id'],
    chapterId = json['chapter_id'],
    bookId = json['book_id'],
    title = json['title'],
    number = json['number'],
    hadisRange = json['hadis_range'],
    bookName = json['book_name'];

  Map<String, dynamic> toMap() => {
        'id': id,
        'chapter_id': chapterId,
        'book_id': bookId,
        'title': title,
        'number': number,
        'hadis_range': hadisRange,
        'book_name': bookName,
      };
}
