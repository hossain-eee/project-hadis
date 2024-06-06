class Section {
  int? id;
  int bookId;
  String bookName;
  int chapterId;
  int sectionId;
  String title;
  String? preface;
  String number;

  Section({
     this.id,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.title,
     this.preface,
    required this.number,
  });

  Section.fromMap(Map<String, dynamic> json) :
    id = json['id'],
    bookId = json['book_id'],
    bookName = json['book_name'],
    chapterId = json['chapter_id'],
    sectionId = json['section_id'],
    title = json['title'],
    preface = json['preface'],
    number = json['number'];
  

  Map<String, dynamic> toMap() => {
        'id': id,
        'book_id': bookId,
        'book_name': bookName,
        'chapter_id': chapterId,
        'section_id': sectionId,
        'title': title,
        'preface': preface,
        'number': number,
      };
}
