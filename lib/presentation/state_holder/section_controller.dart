import 'package:get/get.dart';
import 'package:hadis_application/data/model/section_model.dart';
import 'package:hadis_application/data/service/database_helper.dart';

class SectionController extends GetxController {
  DBHelper? dbHelper = DBHelper();
  List<Section>? _sectionList = [];
  List<Section>? get sectionList => _sectionList;

  Future<void> insertData() async {
    await dbHelper?.insertSectionTable(Section(
        bookId: 1,
        bookName: 'bukhari',
        chapterId: 1,
        sectionId: 1,
        title:
            '''আল্লাহ্‌র রসূল (সাল্লাল্লাহু 'আলাইহি ওয়া সাল্লাম)- এর প্রতি কীভাবে ওয়াহী [১] শুরু হয়েছিল।''',
        preface:
            '''এ মর্মে  আল্লাহ তা’আলার বাণীঃ “নিশ্চয়ই আমি আপনার প্রতি সেরূপ ওয়াহী প্রেরণ করেছি যেরূপ নূহ ও তাঁর পরবর্তী নবীদের প্রতি ওয়াহী প্রেরণ করেছিলাম”। (সূরা আন-নিসা ৪/১৬৩)''',
        number: '১/১. অধ্যায়ঃ'));

    await dbHelper?.insertSectionTable(Section(
        bookId: 1,
        bookName: 'bukhari',
        chapterId: 1,
        sectionId: 2,
        title: '১/২. অধ্যায়ঃ',
        number: '১/২. অধ্যায়ঃ'));

    await dbHelper?.insertSectionTable(Section(
        bookId: 1,
        bookName: 'bukhari',
        chapterId: 1,
        sectionId: 3,
        title: '১/৩. অধ্যায়ঃ',
        number: '১/৩. অধ্যায়ঃ'));

    await dbHelper?.insertSectionTable(Section(
        bookId: 1,
        bookName: 'bukhari',
        chapterId: 1,
        sectionId: 4,
        title: '১/৪. অধ্যায়ঃ',
        number: '১/৪. অধ্যায়ঃ'));

    await dbHelper?.insertSectionTable(Section(
        bookId: 1,
        bookName: 'bukhari',
        chapterId: 1,
        sectionId: 5,
        title: '১/৫. অধ্যায়ঃ',
        number: '১/৫. অধ্যায়ঃ'));

    await dbHelper?.insertSectionTable(Section(
        bookId: 1,
        bookName: 'bukhari',
        chapterId: 1,
        sectionId: 6,
        title: '১/৬. অধ্যায়ঃ',
        number: '১/৬. অধ্যায়ঃ'));
    getSectionList();
    update();
  }

  //get fetch data
  Future<void> getSectionList() async {
    _sectionList = await dbHelper?.getSections();
   
    print('lenght of sectionList is ${_sectionList?.length}');
    update();
print('lenght of sectionList is ${sectionList?.length}');
  }
}
