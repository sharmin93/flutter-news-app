import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/controller/news_list_controller.dart';
import 'package:ud_design/ud_design.dart';
import 'package:ud_widgets/widgets/gaps/gapY.dart';
import 'package:ud_widgets/widgets/texts/text.dart';

import '../../controller/theme_mood_controller.dart';
import '../../reusable/constants/colors.dart';

class NewsListDetails extends StatelessWidget {
  final ThemeMoodController themeController;
  final NewsListController newsController;
  const NewsListDetails({
    Key? key,
    required this.themeController,
    required this.newsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: UdText(
            text: 'News details',
            fontWeight: FontWeight.bold,
            color: ProjectColors.white,
            fontSize: UdDesign.fontSize(18),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title//
            UdText(
              text: newsController.newsListResponse
                          .articles?[newsController.index].author !=
                      null
                  ? 'Author Name: ${newsController.newsListResponse.articles?[newsController.index].author}'
                  : '',
              fontWeight: FontWeight.w500,
              color: themeController.darkMood ? Colors.white : Colors.black,
              fontSize: UdDesign.fontSize(14),
            ),
            UdGapY(
              value: 10,
            ),
            UdText(
              text: newsController.newsListResponse
                          .articles?[newsController.index].title !=
                      null
                  ? 'Title: ${newsController.newsListResponse.articles?[newsController.index].title}'
                  : '',
              fontWeight: FontWeight.w500,
              color: themeController.darkMood ? Colors.white : Colors.black,
              fontSize: UdDesign.fontSize(14),
            ),
            UdGapY(
              value: 10,
            ),
            UdText(
              text: newsController.newsListResponse
                          .articles?[newsController.index].description !=
                      null
                  ? 'Descriptions: ${newsController.newsListResponse.articles?[newsController.index].description}'
                  : '',
              fontWeight: FontWeight.w500,
              color: themeController.darkMood ? Colors.white : Colors.black,
              fontSize: UdDesign.fontSize(14),
            ),
          ],
        ),
      ),
    );
  }
}
