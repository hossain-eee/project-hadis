import 'package:flutter/material.dart';
import 'package:hadis_application/data/model/hadis_model.dart';

class HadisFootNote extends StatelessWidget {
  const HadisFootNote(
      {super.key, required this.hadisData, required this.index});
  final List<Hadis> hadisData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return hadisData[index].note.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: Colors.grey,
              ),
              Text(
                'ফুটনোট:\n ${hadisData[index].note}',
                style: TextStyle(color: Colors.grey, fontFamily: 'Kalpurush'),
              ),
            ],
          )
        : const SizedBox();
  }
}
