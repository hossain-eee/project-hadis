import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadis_application/presentation/state_holder/chapter_controller.dart';
import 'package:hadis_application/presentation/state_holder/book_contrl.dart';
import 'package:hadis_application/presentation/state_holder/hadith_controller.dart';
import 'package:hadis_application/presentation/state_holder/section_controller.dart';
import 'package:hadis_application/presentation/ui/screens/chapter_screen.dart';
import 'package:hadis_application/presentation/ui/widget/background_curly.dart';
import 'package:hadis_application/presentation/ui/widget/hexagon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _dataInitialized = false;
  @override
  void initState() {
    _checkDataInitialization();
    Get.find<BookCntrl>().getBookList();
    Get.find<ChapterController>().getChapterList();

    super.initState();
  }

  void _checkDataInitialization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _dataInitialized = prefs.getBool('dataInitialized') ?? false;
    if (!_dataInitialized) {
      Get.find<BookCntrl>().insertData();
      Get.find<ChapterController>().insertData();
      Get.find<HadisController>().insertData();
      Get.find<SectionController>().insertData();
      prefs.setBool('dataInitialized', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'আল হাদিস',
          style: TextStyle(color: Colors.white, fontFamily: 'Kalpurush'),
        ),
        centerTitle: true,
      ),
      body: BackgroundShape(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<BookCntrl>(builder: (bookCcc) {
            var item = bookCcc.bookList;
            return ListView.builder(
                itemCount: bookCcc.bookList?.length,
                itemBuilder: (context, index) {
                  return Card(
                    // color: Colors.grey[120],
                    color: const Color.fromARGB(240, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () {
                        Get.to(
                            () => ChapterScreen(
                                  title: item[index].title,
                                  subTitle: item[index].numberOfHadis.toString(),
                                ),
                            transition: Transition.rightToLeft);
                      },
                      leading: SizedBox(
                        width: 40,
                        child: Hexagon(
                          size: 40,
                          // color: const Color(0xFF46B891),
                          color: const Color.fromARGB(255, 109, 189, 101),
                          text: item![index].abvrCode,
                          angle: math.pi /
                              6, // Rotate the hexagon by 30 degrees (pi/6 radians)
                        ),
                      ),
                      title: Text(
                        item![index].title,
                        style: const TextStyle(fontFamily: 'Kalpurush'),
                      ),
                      subtitle:  Text(
                        'ইমাম বুখারী',
                        style: TextStyle(fontFamily: 'Kalpurush',color: Colors.grey.shade600),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item[index].numberOfHadis.toString(),
                            style: const TextStyle(
                                fontFamily: "Kalpurush-Ansi",
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'হাদিস',
                            style: TextStyle(
                                fontFamily: 'Kalpurush',
                                color: Colors.grey.shade600),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}
