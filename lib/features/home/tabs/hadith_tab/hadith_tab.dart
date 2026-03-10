import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/extensions/context_ex.dart';
import 'package:islami_app/features/home/tabs/hadith_tab/widgets/hadith_item.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key, });



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageAssets.hadithBgImg), fit: BoxFit.cover)),
      child: Column(
        children: [
          Image.asset(ImageAssets.islamiLogo),
        
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: context.getheight * .68,
                
                viewportFraction: .8,
                enlargeCenterPage: true,
                enlargeFactor: .2,
              ),
              items: List.generate(50, (index) => index+1)
                  .map((index) => HadithItem(index: index,))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}