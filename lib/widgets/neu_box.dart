import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: child),
      decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade900,
              blurRadius: 15,
              offset: Offset(-5, -5),
            ),
            const BoxShadow(
                color: Colors.black, blurRadius: 15, offset: Offset(5, 5))
          ]),
    );
  }
}
