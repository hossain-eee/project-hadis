import 'package:flutter/material.dart';

class BackgroundShape extends StatelessWidget {
  const BackgroundShape({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Colors.grey[100],
        color: Color.fromARGB(255, 244, 244, 244),

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
