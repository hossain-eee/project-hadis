import 'package:get/get.dart';
import 'package:hadis_application/presentation/state_holder/chapter_controller.dart';
import 'package:hadis_application/presentation/state_holder/hadith_controller.dart';
import 'package:hadis_application/presentation/state_holder/section_controller.dart';
import 'package:hadis_application/presentation/state_holder/book_contrl.dart';

class StatHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(BookCntrl());
    Get.put<ChapterController>(ChapterController());
    Get.put<HadisController>(HadisController());
    Get.put<SectionController>(SectionController());
  }
}
