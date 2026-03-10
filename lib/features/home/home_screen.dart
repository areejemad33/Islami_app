import 'package:flutter/material.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:islami_app/features/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami_app/features/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/features/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/features/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami_app/features/home/tabs/time_tab/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: tabs[currentIndex],
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: _onTap,
      items: [
        BottomNavigationBarItem(
        
          icon: _buildIcon(icon: IconAssets.quran, isSelected: currentIndex==0 ),
          
        
         label: "Quran",
        ),
        BottomNavigationBarItem(
      
      icon: _buildIcon(icon: IconAssets.hadith, isSelected: currentIndex==1 ),
          label: "Hadith",
        ),
        BottomNavigationBarItem(
        
            icon: _buildIcon(icon: IconAssets.sebha, isSelected: currentIndex==2 ),
          label: "Sebha",
        ),
        BottomNavigationBarItem(
      
      icon: _buildIcon(icon: IconAssets.radio, isSelected: currentIndex==3 ),
          label: "Radio",
        ),
        BottomNavigationBarItem(
          
        icon: _buildIcon(icon: IconAssets.time, isSelected: currentIndex==4 ),
          label: "Time",
        ),
      ],
    );
  }


  Widget _buildIcon({required String icon, required bool isSelected}) {
    return isSelected
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              color: ColorsManager.black.withOpacity(.6),
              borderRadius: BorderRadius.circular(66),
            ),

            child: ImageIcon(AssetImage(icon)),
          )
        : ImageIcon(AssetImage(icon));
  }

  void _onTap(int tappedIndex) {
    setState(() {
      currentIndex = tappedIndex;
    });
  }
}
