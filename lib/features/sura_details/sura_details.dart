import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:islami_app/models/sura_details_args.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  late SuraDetailsArgs arguments;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    arguments = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    _loadSuraContent(arguments.sura.suraIndex);
  }

  @override
  void dispose() {
    super.dispose();
    arguments.mostRecentKey.currentState?.loadMostRecent();
  }

  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(arguments.sura.suraNameEn)),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(ImageAssets.patternLeft),
              Text(
                arguments.sura.suraNameAr,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Image.asset(ImageAssets.patternRight),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: suraContent.isEmpty
                ? Center(
                    child: CircularProgressIndicator(color: ColorsManager.gold),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        suraContent,
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void _loadSuraContent(String index) async {
    String filePath = "assets/files/suras/$index.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> suraLines = fileContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "(${i + 1})";
    }
    String content = suraLines.join();
    setState(() {
      suraContent = content;
    });
  }
}
