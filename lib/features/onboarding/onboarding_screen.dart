import 'package:flutter/material.dart';
import 'package:islami_app/core/assets_manager.dart';
import 'package:islami_app/core/colors_manager.dart';
import 'package:islami_app/core/routes_manager.dart';
import 'package:islami_app/features/onboarding/onboarding_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:islami_app/core/prefs_manager/prefs_manager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: onboardingList.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = onboardingList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        // Logo at the top
                        Image.asset(
                          ImageAssets.islamiLogo,
                          height: screenHeight * 0.15,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 30),

                        // Main Image
                        Expanded(
                          child: Image.asset(item.image, fit: BoxFit.contain),
                        ),
                        const SizedBox(height: 40),

                        // Title
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),

                        // Description
                        Text(
                          item.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Navigation Buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: ColorsManager.gold,
                    ),
                    onPressed: currentIndex == 0
                        ? null
                        : () {
                            controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                    child: const Text("Back"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: onboardingList.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 5,
                        expansionFactor: 4, // ده اللي بيكبر عرض النقطة الحالية
                        spacing: 6,
                        dotColor: Colors.grey,
                        activeDotColor: ColorsManager.gold,
                      ),
                    ),
                  ),

                  // Next / Finish button
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: ColorsManager.gold,
                    ),
                    onPressed: () async {
                      if (currentIndex == onboardingList.length - 1) {
                        await PrefsManager.setSeenOnboarding();
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesManager.homeScreen,
                        );
                      } else {
                        controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      currentIndex == onboardingList.length - 1
                          ? "Finish"
                          : "Next",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
