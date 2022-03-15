import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/reusable/enums/enums.dart';
import 'package:provider/provider.dart';
import 'package:ud_design/ud_design.dart';
import 'package:ud_widgets/widgets/buttons/basic_button.dart';
import 'package:ud_widgets/widgets/cards/card.dart';
import 'package:ud_widgets/widgets/gaps/gapY.dart';
import 'package:ud_widgets/widgets/texts/text.dart';

import '../../controller/news_list_controller.dart';
import '../../controller/theme_mood_controller.dart';
import '../../reusable/constants/colors.dart';
import '../../reusable/widgets/loader_widgets.dart';
import 'new_list_deatils.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    context.read<NewsListController>().getNews();
    super.initState();
  }

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
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          newsListProvider.dataState == DataState.loaded
              ? Expanded(
                  child: SizedBox(
                    child: newsListProvider.newsListResponse.articles != null
                        ? ListView.builder(
                            itemCount: newsListProvider
                                    .newsListResponse.articles?.length ??
                                3,
                            shrinkWrap: false,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  newsListProvider.index = index;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NewsListDetails(),
                                    ),
                                  );
                                },
                                child: UdCard(
                                  backgroundColor: themeProvider.darkMood
                                      ? Colors.black
                                      : Colors.white,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //author name//
                                      newsListProvider.newsListResponse
                                                  .articles?[index].author !=
                                              null
                                          ? UdText(
                                              color: themeProvider.darkMood
                                                  ? Colors.white
                                                  : Colors.black,
                                              text:
                                                  'Author Name: ${newsListProvider.newsListResponse.articles?[index].author!.toString()}')
                                          : UdText(text: 'No Author name'),

                                      UdGapY(
                                        value: 10,
                                      ),

                                      //title//
                                      newsListProvider.newsListResponse
                                                  .articles?[index].title !=
                                              null
                                          ? UdText(
                                              fontWeight: FontWeight.w500,
                                              color: themeProvider.darkMood
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontSize: UdDesign.fontSize(14),
                                              text:
                                                  'Title: ${newsListProvider.newsListResponse.articles?[index].title!.toString()}')
                                          : UdText(
                                              text: 'No title',
                                            ),
                                      UdGapY(
                                        value: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                        : const SizedBox(),
                  ),
                )
              : const SizedBox(),
          newsListProvider.dataState == DataState.empty
              ? Center(
                  child: UdText(
                      text: 'No news found.',
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: UdDesign.fontSize(12)),
                )
              : const SizedBox(),
          newsListProvider.dataState == DataState.loading
              ? Center(
                  child: CircleLoader(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
