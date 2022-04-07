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
    final themeController = Provider.of<ThemeMoodController>(context);
    return Scaffold(
      body: Consumer<NewsListController>(
        builder: (_, newListController, __) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              newListController.dataState == DataState.loaded
                  ? Expanded(
                      child: SizedBox(
                        child: newListController.newsListResponse.articles !=
                                null
                            ? ListView.builder(
                                itemCount: newListController
                                    .newsListResponse.articles?.length,
                                shrinkWrap: false,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      newListController.index = index;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => NewsListDetails(
                                              newsController: newListController,
                                              themeController: themeController),
                                        ),
                                      );
                                    },
                                    child: UdCard(
                                      backgroundColor: themeController.darkMood
                                          ? Colors.black
                                          : Colors.white,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //author name//
                                          newListController
                                                      .newsListResponse
                                                      .articles?[index]
                                                      .author !=
                                                  null
                                              ? UdText(
                                                  color:
                                                      themeController.darkMood
                                                          ? Colors.white
                                                          : Colors.black,
                                                  text:
                                                      'Author Name: ${newListController.newsListResponse.articles?[index].author!.toString()}')
                                              : UdText(text: 'No Author name'),

                                          UdGapY(
                                            value: 10,
                                          ),

                                          //title//
                                          newListController.newsListResponse
                                                      .articles?[index].title !=
                                                  null
                                              ? UdText(
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      themeController.darkMood
                                                          ? Colors.white
                                                          : Colors.black,
                                                  fontSize:
                                                      UdDesign.fontSize(14),
                                                  text:
                                                      'Title: ${newListController.newsListResponse.articles?[index].title!.toString()}')
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
              newListController.dataState == DataState.empty
                  ? Center(
                      child: UdText(
                          text: 'No news found.',
                          fontWeight: FontWeight.w500,
                          color: themeController.darkMood
                              ? Colors.white
                              : Colors.black,
                          fontSize: UdDesign.fontSize(12)),
                    )
                  : const SizedBox(),
              newListController.dataState == DataState.error
                  ? Center(
                      child: Column(
                        children: [
                          UdText(
                              text:
                                  'Something went wrong. Please try again later.',
                              fontWeight: FontWeight.w500,
                              color: themeController.darkMood
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: UdDesign.fontSize(12)),
                          UdGapY(
                            value: 10,
                          ),
                          UdBasicButton(
                            onTap: () {
                              newListController.getNews();
                            },
                            width: UdDesign.pt(100),
                            backgroundColor: ProjectColors.themeBlue,
                            borderRadius: UdDesign.pt(4),
                            height: UdDesign.pt(48),
                            title: "Try again",
                            titleColor: Colors.white,
                            titleFontSize: UdDesign.fontSize(16),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              newListController.dataState == DataState.loading
                  ? Center(
                      child: CircleLoader(),
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
