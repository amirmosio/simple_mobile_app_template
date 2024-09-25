import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/headings.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/texts.dart';
import 'package:simple_mobile_app_template/general/utils/size_utils.dart';
import 'package:simple_mobile_app_template/routing_config/routes.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  // ignore: non_constant_identifier_names
  void navigate_to_home() {
    Navigator.of(context).pushReplacementNamed(
      Routes.basePage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/onboarding.png"),
                  fit: BoxFit.cover,
                  opacity: 0.45)),
        ),
        Column(
          children: [
            Expanded(
              child: IntroductionScreen(
                pages: getPages(),
                onDone: () {
                  navigate_to_home();
                },
                onSkip: () {
                  navigate_to_home();
                },
                showSkipButton: false,
                showNextButton: false,
                showBackButton: false,
                showDoneButton: false,
                globalBackgroundColor: Colors.transparent,
                skip: const Icon(Icons.skip_next),
                next: const Icon(Icons.arrow_forward),
                done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
                dotsDecorator: DotsDecorator(
                  size: const Size.square(10.0),
                  activeSize: const Size(20.0, 10.0),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SU.relH(70, context), top: SU.relH(30, context)),
              child: ElevatedButton(
                onPressed: () {
                  navigate_to_home();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorRes.primaryBrown,
                    fixedSize: Size(SU.relW(286, context), SU.relH(64, context))),
                child: Text(
                  "Get Started",
                  style: H4TextStyle(color: ColorRes.bgGray20),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          title: "",
          body: "",
          decoration: const PageDecoration(pageMargin: EdgeInsets.only(bottom: 5)),
          footer: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Good Coffee,",
                style: H3TextStyle(color: ColorRes.uiGray40),
              ),
              Text(
                "Good Friends,",
                style: H3TextStyle(color: ColorRes.uiGray40),
              ),
              Text(
                "let it blends",
                style: H3TextStyle(color: ColorRes.uiGray40),
              ),
              SizedBox(
                height: SU.relH(16, context),
              ),
              Text(
                "The best grain, the finest roast,",
                style: BodySmTextStyle(color: ColorRes.tWhite),
              ),
              Text(
                "the most powerful flavor.",
                style: BodySmTextStyle(color: ColorRes.tWhite),
              ),
            ],
          )),
      PageViewModel(
        title: "Welcome",
        body: "This is the second page of the onboarding screen.",
        decoration: PageDecoration(
          titleTextStyle: H3TextStyle(color: ColorRes.uiGray40),
          bodyTextStyle: BodySmTextStyle(color: ColorRes.tWhite),
        ),
      ),
      PageViewModel(
          title: "Discover",
          body: "This is the third page of the onboarding screen.",
          decoration: PageDecoration(
            titleTextStyle: H3TextStyle(color: ColorRes.uiGray40),
            bodyTextStyle: BodySmTextStyle(color: ColorRes.tWhite),
          )),
    ];
  }
}
