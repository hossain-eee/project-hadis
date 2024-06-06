import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadis_application/presentation/state_holder/section_controller.dart';

class HadisSction extends StatelessWidget {
  const HadisSction({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SectionController>(
      builder: (sectionCtrl) {
        if (sectionCtrl.sectionList == null ||
            sectionCtrl.sectionList!.isEmpty) {
          return const SizedBox();
        }
        return SizedBox(
          width: double.infinity,
          child: index < sectionCtrl.sectionList!.length
              ? Card(
                  // color: const Color.fromARGB(255,253, 253, 253),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  '${sectionCtrl.sectionList![index].number} ',
                              /*     style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontFamily: 'Kalpurush'), */
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 80, 155, 136),
                                  fontFamily: 'Kalpurush',
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  wordSpacing: 2,
                                  fontWeight: FontWeight.bold),
                            ),
                            //if preface empty then don't call title
                            if (sectionCtrl.sectionList![index].preface != null)
                              TextSpan(
                                  text: sectionCtrl.sectionList![index].title,
                                  /*     style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.black,
                                        fontFamily: 'Kalpurush'), */
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                          ]),
                        ),
                        if (sectionCtrl.sectionList![index].preface != null)
                          Divider(
                            color: Colors.grey[200],
                          ),
                        if ((sectionCtrl.sectionList![index].preface != null))
                          Text(
                            sectionCtrl.sectionList![index].preface!,
                            /*    style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Colors.grey[600],
                                    fontFamily: 'Kalpurush'), */
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                                fontFamily: 'Kalpurush'),
                          ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
