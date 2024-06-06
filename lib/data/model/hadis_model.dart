class Hadis {
  int? hadithId;
  int bookId;
  String bookName;
  int chapterId;
  int sectionId;
  String narrator;
  String bn;
  String ar;
  String arDiacless;
  String note;
  int gradeId;
  String grade;
  String gradeColor;

  Hadis({
     this.hadithId,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.narrator,
    required this.bn,
    required this.ar,
    required this.arDiacless,
    required this.note,
    required this.gradeId,
    required this.grade,
    required this.gradeColor,
  });

  Hadis.fromMap(Map<String, dynamic> json) :
    hadithId = json['hadith_id'],
    bookId = json['book_id'],
    bookName = json['book_name'],
    chapterId = json['chapter_id'],
    sectionId = json['section_id'],
    narrator = json['narrator'],
    bn = json['bn'],
    ar = json['ar'],
    arDiacless = json['ar_diacless'],
    note = json['note'],
    gradeId = json['grade_id'],
    grade = json['grade'],
    gradeColor = json['grade_color'];
  

  Map<String, dynamic> toMap() => {
        'hadith_id': hadithId,
        'book_id': bookId,
        'book_name': bookName,
        'chapter_id': chapterId,
        'section_id': sectionId,
        'narrator': narrator,
        'bn': bn,
        'ar': ar,
        'ar_diacless': arDiacless,
        'note': note,
        'grade_id': gradeId,
        'grade': grade,
        'grade_color': gradeColor,
      };
}
