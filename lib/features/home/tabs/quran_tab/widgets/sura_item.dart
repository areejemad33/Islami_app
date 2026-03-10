import 'package:flutter/material.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/prefs_manager/prefs_manager.dart';
import 'package:islami_app/core/routes_manager.dart';
import 'package:islami_app/features/home/tabs/quran_tab/widgets/most_recently.dart';
import 'package:islami_app/models/sura_details_args.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraItem extends StatefulWidget {
  SuraItem({super.key, required this.sura, required this.onClick, required this.mostRecentKey});
  SuraModel sura;
  final void Function() onClick;
  final GlobalKey<MostRecentlyState> mostRecentKey;

  @override
  State<SuraItem> createState() => _SuraItemState();
}

class _SuraItemState extends State<SuraItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        PrefsManager.saveSura(widget.sura);
        Navigator.pushNamed(
          context,
          RoutesManager.suraDetails,
          arguments: SuraDetailsArgs(sura: widget.sura, mostRecentKey: widget.mostRecentKey)
        );
        widget.onClick();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Image.asset(ImageAssets.suraNumberBgImage),
                Text(
                  widget.sura.suraIndex,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(width: 24),
              ],
            ),
            SizedBox(width: 24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.sura.suraNameEn,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    widget.sura.versesNum,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              widget.sura.suraNameAr,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
