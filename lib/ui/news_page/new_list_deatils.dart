import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/controller/news_list_controller.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';
import 'package:ud_widgets/widgets/buttons/basic_button.dart';
import 'package:ud_widgets/widgets/gaps/gapY.dart';
import 'package:ud_widgets/widgets/texts/text.dart';

import '../../controller/theme_mood_controller.dart';
import '../../reusable/constants/colors.dart';

class NewsListDetails extends StatefulWidget {
  const NewsListDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsListDetails> createState() => _NewsListDetailsState();
}

class _NewsListDetailsState extends State<NewsListDetails> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeMoodController>(context);
    final newsListProvider = Provider.of<NewsListController>(context);
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UdText(
            text: 'News details',
            fontWeight: FontWeight.bold,
            color: ProjectColors.white,
            fontSize: UdDesign.fontSize(18),
          ),
          UdBasicButton(
            backgroundColor:
                themeProvider.darkMood ? Colors.black : Colors.white,
            height: UdDesign.pt(30),
            width: UdDesign.pt(80),
            titleFontSize: UdDesign.fontSize(14),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SizedBox(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //title//
                  UdText(
                    text: newsListProvider.newsListResponse
                                .articles?[newsListProvider.index].author !=
                            null
                        ? 'Author Name: ${newsListProvider.newsListResponse.articles?[newsListProvider.index].author}'
                        : '',
                    fontWeight: FontWeight.w500,
                    color: themeProvider.darkMood ? Colors.white : Colors.black,
                    fontSize: UdDesign.fontSize(14),
                  ),
                  UdGapY(
                    value: 10,
                  ),
                  UdText(
                    text: newsListProvider.newsListResponse
                                .articles?[newsListProvider.index].title !=
                            null
                        ? 'Title: ${newsListProvider.newsListResponse.articles?[newsListProvider.index].title}'
                        : '',
                    fontWeight: FontWeight.w500,
                    color: themeProvider.darkMood ? Colors.white : Colors.black,
                    fontSize: UdDesign.fontSize(14),
                  ),
                  UdGapY(
                    value: 10,
                  ),
                  UdText(
                    text: newsListProvider
                                .newsListResponse
                                .articles?[newsListProvider.index]
                                .description !=
                            null
                        ? 'Descriptions: ${newsListProvider.newsListResponse.articles?[newsListProvider.index].description}'
                        : '',
                    fontWeight: FontWeight.w500,
                    color: themeProvider.darkMood ? Colors.white : Colors.black,
                    fontSize: UdDesign.fontSize(14),
                  ),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
