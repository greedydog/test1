import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LodingAnimation extends StatefulWidget {
  const LodingAnimation({super.key});

  @override
  State<LodingAnimation> createState() => _LodingAnimationState();
}

class _LodingAnimationState extends State<LodingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Positioned(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   child: Center(
            //     child: Container(
            //       height: 400,
            //       width: 400,
            //       decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: Colors.purple.withOpacity(0.5)),
            //       child: BackdropFilter(
            //         filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
            //         child: Container(
            //           height: 400,
            //           width: 400,
            //           color: Colors.transparent,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: SpinKitCircle(
                  color: Colors.purpleAccent.withOpacity(0.7),
                  size: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
