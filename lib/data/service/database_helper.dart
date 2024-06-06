import 'package:hadis_application/data/model/book_model.dart';
import 'package:hadis_application/data/model/chapter_model.dart';
import 'package:hadis_application/data/model/section_model.dart';
import 'package:hadis_application/data/model/hadis_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _db; // database object

  //called the database, if _db is not null then called it, unless create database
  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDatabase();
      return _db;
    }
  }

  //create database environment for create database when _db is null,  initialize a database for storing data
  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,
        'hadis.db'); // add path with notes database (notes.db=database name)
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    // version for playstore upload app and update verson then add number of version, onCreate- is for create database
    return db;
  }

  //called back method for creating database

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE books(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  title_ar TEXT,
  number_of_hadis INTEGER,
  abvr_code TEXT,
  book_name TEXT,
  book_descr TEXT
)
''');

    await db.execute('''
CREATE TABLE chapter(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  chapter_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  title VARCHAR  NOT NULL,
  number INTEGER NOT NULL,
  hadis_range VARCHAR ,
  book_name VARCHAR  NOT NULL,
  FOREIGN KEY (book_id) REFERENCES books(id)
)
''');

    await db.execute('''
CREATE TABLE hadis(
  hadith_id INTEGER PRIMARY KEY AUTOINCREMENT,
  book_id INTEGER,
  book_name VARCHAR ,
  chapter_id INTEGER,
  section_id INTEGER,
  narrator VARCHAR ,
  bn VARCHAR ,
  ar VARCHAR ,
  ar_diacless VARCHAR ,
  note VARCHAR ,
  grade_id INTEGER,
  grade VARCHAR ,
  grade_color VARCHAR ,
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (chapter_id) REFERENCES chapter(id)
)
''');

    await db.execute('''
CREATE TABLE section(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  book_id INTEGER NOT NULL,
  book_name TEXT NOT NULL,
  chapter_id INTEGER NOT NULL,
  section_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  preface TEXT,
  number VARCHAR,
  FOREIGN KEY (book_id) REFERENCES books(id),
  FOREIGN KEY (chapter_id) REFERENCES chapter(id)
)
''');
  }

  // insert data methods

  Future<Book> insertBookTable(Book bookModel) async {
    var dbClient = await db;
    await dbClient!.insert('books', bookModel.toMap());
    return bookModel;
  }

  Future<Chapter> insertChapterTable(Chapter chapterModel) async {
    var dbClient = await db;
    await dbClient!.insert('chapter', chapterModel.toMap());
    return chapterModel;
  }

  Future<Hadis> insertHadisTable(Hadis hadisModel) async {
    var dbClient = await db;
    await dbClient!.insert('hadis', hadisModel.toMap());
    return hadisModel;
  }

  Future<Section> insertSectionTable(Section sectionModel) async {
    var dbClient = await db;
    await dbClient!.insert('section', sectionModel.toMap());
    return sectionModel;
  }

  //recived data from database

  Future<List<Book>> getBooks() async {
    Database? db = await this.db;
    List<Map<String, dynamic>> result = await db!.query('books');
    return result.map((json) => Book.fromMap(json)).toList();
  }

  Future<List<Chapter>> getChapters() async {
    Database? db = await this.db;
    List<Map<String, dynamic>> result = await db!.query('chapter');
    return result.map((json) => Chapter.fromMap(json)).toList();
  }

  Future<List<Hadis>> getHadis() async {
    Database? db = await this.db;
    List<Map<String, dynamic>> result = await db!.query('hadis');
    return result.map((json) => Hadis.fromMap(json)).toList();
  }

  Future<List<Section>> getSections() async {
    Database? db = await this.db;
    List<Map<String, dynamic>> result = await db!.query('section');
    return result.map((json) => Section.fromMap(json)).toList();
  }
}
