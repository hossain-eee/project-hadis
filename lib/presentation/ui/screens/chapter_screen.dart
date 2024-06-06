import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hadis_application/presentation/state_holder/book_contrl.dart';
import 'package:hadis_application/presentation/state_holder/chapter_controller.dart';
import 'package:hadis_application/presentation/ui/screens/hadis_screen.dart';
import 'package:hadis_application/presentation/ui/widget/background_curly.dart';
import 'package:hadis_application/presentation/ui/widget/hexagon.dart';
import 'dart:math' as math;

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Get.previousRoute != null
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () => Get.back(),
              )
            : null, // Hide if no previous route,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontFamily: 'Kalpurush',
                    color: Colors.white,
                  ),
            ),
            Text(
              subTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontFamily: 'Kalpurush', color: Colors.white),
            )
          ],
        ),

        /*  ListTile(
          title: Text(title),
          subtitle: Text(subTitle),
        ), */
      ),
      body: BackgroundShape(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<ChapterController>(builder: (chapter) {
            var item = chapter.chapterList;
            return ListView.builder(
                itemCount: chapter.chapterList?.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(240, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      onTap: () {
                        Get.to(
                            () => HadisScreen(
                                  title: title,
                                  subTitle: item[index].title,
                                ),
                            transition: Transition.rightToLeft);
                      },
                      leading: SizedBox(
                        width: 40,
                        child: Hexagon(

                          size: 40,
                          color: const Color.fromARGB(255, 26, 164, 131),
                          text: item![index].number.toString(),
                          angle: math.pi /
                              6, // Rotate the hexagon by 30 degrees (pi/6 radians)
                              fntFamily :"Kalpurush",
                        ),
                      ),
                      title: Text(
                        item![index].title,
                        style: const TextStyle(fontFamily: 'Kalpurush'),
                      ),
                      subtitle: Text(
                        "হাদিসের রেঞ্জ: ${item[index].hadisRange}",
                        style: const TextStyle(fontFamily: 'Kalpurush'),
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
