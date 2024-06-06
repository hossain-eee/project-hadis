import 'package:flutter/material.dart';
import 'package:hadis_application/data/model/hadis_model.dart';
import 'dart:math' as math;

import 'package:hadis_application/presentation/ui/widget/hexagon.dart';

class HadisDetails extends StatelessWidget {
  Widget bottomSheetConttent(
    BuildContext context,
    IconData iconData,
    String text,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            size: 27,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: 'Kalpurush',
              ),
        ),
      ],
    );
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'অন্যান্য অপশন',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Kalpurush',
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.close))
                      ],
                    ),
                    bottomSheetConttent(
                      context,
                      Icons.bookmark_border,
                      'কালেকশন এড করুন',
                    ),
                    bottomSheetConttent(
                      context,
                      Icons.copy_rounded,
                      'বাংলা কপি',
                    ),
                    bottomSheetConttent(
                      context,
                      Icons.copy_rounded,
                      'আরবি কপি',
                    ),
                    bottomSheetConttent(
                      context,
                      Icons.copy_rounded,
                      'সম্পূর্ণ হাদিস কপি',
                    ),
                    bottomSheetConttent(
                      context,
                      Icons.image_outlined,
                      'স্ক্রিনশট শেয়ার',
                    ),
                    bottomSheetConttent(
                      context,
                      Icons.share_outlined,
                      'টেক্সট শেয়ার',
                    ),
                    bottomSheetConttent(
                      context,
                      Icons.report_outlined,
                      'রিপোর্ট',
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  const HadisDetails(
      {super.key,
      required this.title,
      required this.hadisData,
      required this.index});
  final String title;
  final List<Hadis> hadisData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 35,
          child: Hexagon(
            size: 35,
            color: Color.fromARGB(255, 109, 189, 101),
            text: 'B',
            angle:
                math.pi / 6, // Rotate the hexagon by 30 degrees (pi/6 radians)
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              /*   style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontFamily: 'Kalpurush'), */
              style: const TextStyle(
                  fontFamily: 'Kalpurush',
                  fontSize: 15,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 1),
            ),
            Text(
              "হাদিস: ${hadisData[index].sectionId}",
              /*    style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontFamily: 'Kalpurush'), */
              style: const TextStyle(
                  color: Color.fromARGB(255, 80, 155, 136),
                  fontFamily: 'Kalpurush-Ansi',
                  fontSize: 15,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  wordSpacing: 2),
            ),
          ],
        ),
        const Spacer(),
        /*  SizedBox(
          width: 70,
          child: Chip(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            side: BorderSide.none,
            padding: EdgeInsets.zero,
            label: FittedBox(
              child: Text(
                hadisData[index].grade,
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'Kalpurush'),
              ),
            ),
            backgroundColor: const Color(0xFF46B891),
          ),
        ), */
        Container(
          width: 80,
          height: 25,
          // padding: EdgeInsets.only(top: 3),
          decoration: BoxDecoration(
            // color: const Color(0xFF46B891),
            color: const Color.fromARGB(255, 69, 184, 145),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              hadisData[index].grade,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'Kalpurush',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            bottomSheet(context);
          },
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
