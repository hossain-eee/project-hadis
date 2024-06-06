import 'package:get/get.dart';
import 'package:hadis_application/data/model/book_model.dart';
import 'package:hadis_application/data/service/database_helper.dart';

class BookCntrl extends GetxController {
  DBHelper? dbHelper = DBHelper();
  List<Book>? _bookList = [];
  List<Book>? get bookList => _bookList;

  Future<void> insertData() async {
    await dbHelper?.insertBookTable(Book(
        title: 'সহিহ বুখারী',
        titleAr: 'صحيح البخاري',
        numberOfHadis: 7563,
        abvrCode: 'B',
        bookName: 'bukhari',
        bookDescr: 'bookDescr 1',
        bookDescription:
            'সংকলক : শাইখ ইমামুল হুজ্জাহ আবু ‘আবদুল্লাহ মুহাম্মাদ বিন ইসমা’ঈল বিন ইবরাহীম বিন মুগীরাহ্‌ আল বুখারী আল-জু’ফী। মোট হাদীস সংখ্যা : ৭৫৬৩ টি। প্রকাশনী : তাওহীদ পাবলিকেশন্স। মৌলিক হাদীস গ্রন্থ হিসাবে সহীহুল বুখারী গ্রন্থটি হাদীসের কিতাবগুলির মধ্যে সর্বশ্রেষ্ঠ। শুধু তাই নয় এর সংশ্লিষ্ট ব্যক্তিগবের্গর সর্বজন স্বীকৃত মন্তব্য হলো : আল কুরআনের পরে মানব রচিত বা সংকলিত গ্রন্থের মধ্যে সর্বশ্রেষ্ঠ কিতাব নিঃসন্দেহে সহীহুল বুখারী। বুখারী সংকলন করতে গিয়ে ইমাম বুখারী (রহঃ) কে যে কী পরিমাণ পরিশ্রম ও সাধনা করতে হয়েছে তা বর্ণনাতীত। মহান আল্লাহ তা’আলা তাঁর এই পরিশ্রমকে ক্ববুল করুন এবং এ মহান সাদাকায়ে যারিয়ার জন্য তাঁকে জান্নাতুল ফেরদৌস-এর পুরষ্কারে ভুষিত করুন। - আমীন।'));
    getBookList();
    update();
  }

  //get fetch data
  Future<void> getBookList() async {
    _bookList = await dbHelper?.getBooks();

    update();
  }
}
