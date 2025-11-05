import 'package:flutter/material.dart';
import 'package:howbadami/app/mobile/pages/main/onboarding/login_page.dart';
import 'package:howbadami/app/mobile/pages/main/onboarding/onboarding_page.dart';
import 'package:howbadami/app/mobile/scaffolds/app_bottom_bar_buttons.dart';
import 'package:howbadami/app/mobile/widgets/button_widget.dart';
import 'package:howbadami/core/constants/app_assets.dart';
import 'package:howbadami/core/constants/words.dart';
import 'package:howbadami/core/theme/app_text_styles.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomBarButtons(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Center(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.primary,
                      BlendMode.srcATop,
                    ),
                    child: Lottie.asset(
                      AppAssets.lottieGrafico,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: Words.welcomeTo,
                                style: AppTextStyles.xxl,
                              ),
                              TextSpan(
                                text: Words.howbadami,
                                style: AppTextStyles.xxlBlack,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        Words.theWelcomePhrase,
                        style: AppTextStyles.m.copyWith(color: Colors.white54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      buttons: [
        ButtonWidget(
          label: Words.getStarted,
          isFilled: true,
          callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const OnboardingPage();
                },
              ),
            );
          },
        ),
        const SizedBox(height: 10.0),
        ButtonWidget(
          label: Words.login,
          callback: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginPage();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
