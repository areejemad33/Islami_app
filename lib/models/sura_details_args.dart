import 'package:flutter/widgets.dart';
import 'package:islami_app/features/home/tabs/quran_tab/widgets/most_recently.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraDetailsArgs {
  SuraModel sura;
  GlobalKey<MostRecentlyState> mostRecentKey;
  SuraDetailsArgs({required this.sura, required this.mostRecentKey});
}
