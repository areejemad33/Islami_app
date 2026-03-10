import 'package:islami_app/core/constant_manag.dart';
import 'package:islami_app/models/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static Future<void> saveSura(SuraModel sura) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSuras =
        prefs.getStringList(CacheConstant.mostRecentKey) ?? [];
    if (mostRecentSuras.contains(sura.suraIndex)) {
      mostRecentSuras.remove(sura.suraIndex);
    }
    mostRecentSuras.add(sura.suraIndex);
    prefs.setStringList("most_recent_suras", mostRecentSuras);
    print(mostRecentSuras.length);
  }

  static Future<List<SuraModel>> getMostRecentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        prefs.getStringList(CacheConstant.mostRecentKey) ?? [];
    List<SuraModel> mostRecentSuras = [];
    for (int i = 0; i < mostRecentSurasIndex.length; i++) {
      int index = int.parse(mostRecentSurasIndex[i]);
      mostRecentSuras.add(SuraModel.suras[index - 1]);
    }
    return mostRecentSuras.reversed.toList();
  }

  static Future<bool> checkFirstTime() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("seenOnboarding") ?? false;
}
static Future<void> setSeenOnboarding() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("seenOnboarding", true);
}
}
