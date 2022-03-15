import 'package:flutter/material.dart';
import 'package:flutter_news_app/ui/news_page/news_list.dart';
import 'package:ud_design/ud_design.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, String? title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    UdDesign.init(context);
    return const Scaffold(
      body: NewsList(),
    );
  }
}
