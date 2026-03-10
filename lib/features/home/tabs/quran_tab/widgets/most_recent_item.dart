import 'package:flutter/material.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:islami_app/models/sura_model.dart';

class MostRecentItem extends StatelessWidget {
  MostRecentItem({super.key, required this.sura});
  SuraModel sura;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.gold,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 300,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sura.suraNameEn,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  sura.suraNameAr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "${sura.versesNum} Verses",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            Image.asset(ImageAssets.mostRecent),
          ],
        ),
      ),
    );
  }
}
