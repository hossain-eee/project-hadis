import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadis_application/presentation/state_holder/hadith_controller.dart';
import 'package:hadis_application/presentation/state_holder/section_controller.dart';
import 'package:hadis_application/presentation/ui/widget/hadis_details.dart';
import 'package:hadis_application/presentation/ui/widget/hadis_foot_note.dart';
import 'package:hadis_application/presentation/ui/widget/hadis_section.dart';

class HadisScreen extends StatefulWidget {
  const HadisScreen({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  State<HadisScreen> createState() => _HadisScreenState();
}

class _HadisScreenState extends State<HadisScreen> {
  @override
  void initState() {
    Get.find<HadisController>().getHadisList();
    Get.find<SectionController>().getSectionList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HadisController>(builder: (hadisController) {
          var hadisData = hadisController.hadisList;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: const SizedBox(),
                pinned: false,
                floating: true,
                expandedHeight: 70,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  title: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 120, // Adjust the width as needed
                          height: Get.height * 0.05,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Kalpurush'),
                              ),
                              Text(
                                widget.subTitle,
                                style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontFamily: 'Kalpurush'),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'images/icon2.PNG',
                            width: 18,
                            height: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  ),

                  /*     background: Image.asset(
                      'assets/images/images.jpg',
                      fit: BoxFit.cover,
                    ), */
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      padding: index == 0
                          ? const EdgeInsets.only(left: 10, right: 10, top: 10)
                          : const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // color: Colors.grey[100],
                        color: const Color.fromARGB(255, 244, 244, 244),

                        borderRadius: index == 0
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )
                            : null,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 3,
                          ),
                          //hadis section that means chapter and number
                          HadisSction(
                            index: index,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //hadis detials on top like hadis book name, sahi, icon for Bottomsheet all in HadisDetails()
                                  HadisDetails(
                                    title: widget.title,
                                    hadisData: hadisData!,
                                    index: index,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    hadisData[index].ar,
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                        fontFamily: 'KFGQ',
                                        fontSize: 20,
                                        letterSpacing: 1,
                                        wordSpacing: 3),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${hadisData[index].narrator} থেকে বর্ণিত:',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 80, 155, 136),
                                        fontFamily: 'Kalpurush',
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        wordSpacing: 1),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    hadisData[index].bn,
                                    style: const TextStyle(
                                        fontFamily: 'Kalpurush',
                                        fontSize: 16,
                                        letterSpacing: 1,
                                        wordSpacing: 2),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  HadisFootNote(
                                    hadisData: hadisData,
                                    index: index,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: hadisData?.length ?? 0, // specify itemCount
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
