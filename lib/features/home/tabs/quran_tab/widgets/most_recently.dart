import 'package:flutter/material.dart';
import 'package:islami_app/core/extensions/context_ex.dart';
import 'package:islami_app/core/prefs_manager/prefs_manager.dart';
import 'package:islami_app/core/routes_manager.dart';
import 'package:islami_app/features/home/tabs/quran_tab/widgets/most_recent_item.dart';
import 'package:islami_app/models/sura_details_args.dart';
import 'package:islami_app/models/sura_model.dart';

class MostRecently extends StatefulWidget {
  const MostRecently({super.key});

  @override
  State<MostRecently> createState() => MostRecentlyState();
}

class MostRecentlyState extends State<MostRecently> {
  List<SuraModel> mostRecentSuras = [];
  void loadMostRecent() async {
    mostRecentSuras = await PrefsManager.getMostRecentSuras();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadMostRecent();
  }
  // @override
  // void didUpdateWidget(covariant MostRecently oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //     loadMostRecent();
  // }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecentSuras.isEmpty ? false : true,
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "  Most Recently",
              style: Theme.of(context).textTheme.labelSmall,
            ),
            SizedBox(height: context.getheight * .005),

            SizedBox(
              height: context.getheight * 0.17,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    PrefsManager.saveSura(mostRecentSuras[index]);
                    Navigator.pushNamed(
                      context,
                      RoutesManager.suraDetails,
                      arguments: SuraDetailsArgs(
                        sura: mostRecentSuras[index],
                        mostRecentKey:
                            widget.key as GlobalKey<MostRecentlyState>,
                      ),
                    );
                  },
                  child: MostRecentItem(sura: mostRecentSuras[index]),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 1),
                itemCount: mostRecentSuras.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
