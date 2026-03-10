import 'package:islami_app/core/constant_manager.dart';

class SuraModel {
  String suraNameEn;
  String suraNameAr;
  String versesNum;
  String suraIndex;
  SuraModel({
    required this.suraNameEn,
    required this.suraNameAr,
    required this.versesNum,
    required this.suraIndex,
  });
  static List<SuraModel> suras = List.generate(
    ConstantManager.suraNameAr.length,
    (index) => SuraModel(
      suraNameEn: ConstantManager.suraNameEn[index],
      suraNameAr: ConstantManager.suraNameAr[index],
      versesNum: ConstantManager.versesNum[index],
      suraIndex: (index + 1).toString(),
    ),
  );
}
