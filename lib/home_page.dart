import 'package:flutter/material.dart';
import 'package:flutter_news_app/reusable/constants/colors.dart';
import 'package:flutter_news_app/ui/news_page/news_list.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';
import 'package:ud_widgets/widgets/buttons/basic_button.dart';
import 'package:ud_widgets/widgets/texts/text.dart';

import 'controller/theme_mood_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, String? title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    UdDesign.init(context);
    final themeProvider = Provider.of<ThemeMoodController>(context);
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UdText(
            text: 'Health News',
            fontWeight: FontWeight.bold,
            color: ProjectColors.white,
            fontSize: UdDesign.fontSize(18),
          ),
          UdBasicButton(
            backgroundColor:
                themeProvider.darkMood ? Colors.black : Colors.white,
            height: UdDesign.pt(30),
            width: UdDesign.pt(80),
            titleFontSize: UdDesign.fontSize(16),
            borderRadius: UdDesign.pt(4),
            title: "Theme",
            titleColor: themeProvider.darkMood ? Colors.white : Colors.black,
            onTap: () {
              themeProvider.darkMood
                  ? themeProvider.getLightMood()
                  : themeProvider.getDarkMood();
            },
          )
        ],
      )),
      body: const NewsList(),
    );
  }
}
