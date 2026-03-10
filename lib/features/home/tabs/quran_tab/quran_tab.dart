import 'package:flutter/material.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:islami_app/core/extensions/context_ex.dart';
import 'package:islami_app/features/home/tabs/quran_tab/widgets/most_recently.dart';
import 'package:islami_app/features/home/tabs/quran_tab/widgets/sura_item.dart';
import 'package:islami_app/models/sura_model.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SuraModel> filteredList = SuraModel.suras;
  GlobalKey<MostRecentlyState> mostRecentKey = GlobalKey<MostRecentlyState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// BACKGROUND IMAGE
        Positioned.fill(
          child: Opacity(
            opacity: .2, // من 0 → 1
            child: Image.asset(ImageAssets.quranBackground, fit: BoxFit.cover),
          ),
        ),
        CustomScrollView(
          slivers: [
            /// LOGO
            SliverToBoxAdapter(child: Image.asset(ImageAssets.islamiLogo)),

            /// SPACE
            SliverToBoxAdapter(
              child: SizedBox(height: context.getheight * .005),
            ),

            /// SEARCH FIELD
            SliverToBoxAdapter(
              child: TextField(
                onChanged: (searchKey) {
                  filterSurasListBySearckKey(searchKey);
                },
                style: TextStyle(color: ColorsManager.ofwhite, fontSize: 14),
                decoration: InputDecoration(
                  prefixIcon: ImageIcon(AssetImage(IconAssets.quran)),
                  labelText: "Sura Name",
                ),
              ),
            ),

            /// SPACE
            SliverToBoxAdapter(
              child: SizedBox(height: context.getheight * .02),
            ),

        
            /// MOST RECENT HORIZONTAL LIST
            SliverToBoxAdapter(child: MostRecently(key: mostRecentKey,)),

            /// SPACE
            SliverToBoxAdapter(
              child: SizedBox(height: context.getheight * .02),
            ),

            /// SURAS TITLE
            SliverToBoxAdapter(
              child: Text(
                "  Suras List",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(height: context.getheight * .005),
            ),

            /// SURAS LIST (MAIN CHANGE)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                  children: [
                    SuraItem(sura: filteredList[index], onClick: onClick, mostRecentKey: mostRecentKey,),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: ColorsManager.white,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                    ),
                  ],
                ),
                childCount: filteredList.length,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onClick() {
    setState(() {});
  }

  void filterSurasListBySearckKey(String searchKey) {
    filteredList = SuraModel.suras
        .where(
          (sura) =>
              sura.suraNameEn.toUpperCase().contains(searchKey.toUpperCase()) ||
              sura.suraNameAr.contains(searchKey),
        )
        .toList();
    setState(() {});
  }
}
