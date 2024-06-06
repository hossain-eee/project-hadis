import 'package:get/get.dart';
import 'package:hadis_application/data/model/chapter_model.dart';
import 'package:hadis_application/data/service/database_helper.dart';

class ChapterController extends GetxController {
  DBHelper? dbHelper = DBHelper();
  List<Chapter>? _chapterList = [];
  List<Chapter>? get chapterList => _chapterList;

  Future<void> insertData() async {
    await dbHelper?.insertChapterTable(Chapter(chapterId: 1, bookId: 1, title: 'ওহীর সূচনা অধ্যায়', number: 1, hadisRange: '১ - ৭', bookName: 'bukhari'));
    getChapterList();
    update();
  }

  //get fetch data
  Future<void> getChapterList() async {
    _chapterList = await dbHelper?.getChapters();

    update();
  }

}
