import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:islami_app/models/hadith_model.dart';

class HadithItem extends StatefulWidget {
  HadithItem({super.key, required this.index});
  int index;

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  HadithModel? hadith;

  @override
  Widget build(BuildContext context) {
    if (hadith== null) _loadHadithContent(widget.index);
    return Container(
        
          padding: const EdgeInsets.only(left: 8,right:8, top: 12 ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),



      decoration: BoxDecoration(
        image:DecorationImage(image: AssetImage(ImageAssets.hadithCardBgImg)),
        color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: hadith == null
          ? Center(child: CircularProgressIndicator())
          : Column(
    
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                  
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [  Image.asset(ImageAssets.patternLeft, color: ColorsManager.black,),
                          Expanded(
                            child: Text(
                            hadith!.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorsManager.black),
                                                    ),
                          ),
                              Image.asset(ImageAssets.patternRight,color: ColorsManager.black),],
                        ),
                        
                        Text(
                          hadith!.content,
                          textAlign: TextAlign.center,textDirection: TextDirection.rtl,
                          style: TextStyle(color: ColorsManager.black),
                        ),
                      ],
                
                    ),
                ),
              ),
                                  Image.asset(ImageAssets.hadithCardBottomImg, )
    
          
            ],
          ),
    );
  }

  void _loadHadithContent(int index) async {
    String filePath = "assets/files/ahadeth/h$index.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> hadithLines = fileContent.split("\n");
    String title = hadithLines[0];
    hadithLines.removeAt(0);
    String content = hadithLines.join();
    setState(() {
          hadith = HadithModel(title: title, content: content);

    });
  }
}
