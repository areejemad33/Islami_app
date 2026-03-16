import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {

  int counter = 0;
  int currentZekrIndex = 0;
  double angle = 0;

  List<String> azkar = [
    "سبحان الله",
    "الحمدلله",
    "الله أكبر",
  ];

  void incrementCounter() {
    setState(() {

      counter++;
      angle += pi / 12;

      if (counter == 33) {
        counter = 0;

        currentZekrIndex++;

        if (currentZekrIndex == azkar.length) {
          currentZekrIndex = 0;
        }
      }

    });
  }


  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.sebhaBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          children: [

            Image.asset(ImageAssets.islamiLogo),

            SizedBox(height: screenHeight * .05),

            Image.asset(ImageAssets.sebhaAya),

            SizedBox(height: screenHeight * .02),

            Image.asset(ImageAssets.sebhaHead),

            GestureDetector(
              onTap: incrementCounter,
              child: Stack(
                alignment: Alignment.center,
                children: [

                  Transform.rotate(
                    angle: angle,
                    child: Image.asset(
                      ImageAssets.sebhaBody,
                    ),
                  ),

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Text(
                        azkar[currentZekrIndex],
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.ofwhite,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "$counter",
                        style: TextStyle(
                          fontSize: 36,
                          color: ColorsManager.ofwhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
