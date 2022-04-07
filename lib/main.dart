import 'package:flutter/material.dart';
import 'package:flutter_news_app/home_page.dart';
import 'package:provider/provider.dart';

import 'controller/news_list_controller.dart';
import 'controller/theme_mood_controller.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => NewsListController()),
    ChangeNotifierProvider(create: (_) => ThemeMoodController()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter news app',
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<ThemeMoodController>().darkMood
          ? ThemeMode.dark
          : ThemeMode.light,
      theme:
          ThemeData(primarySwatch: Colors.blue, backgroundColor: Colors.white),
      home: const HomePage(),
    );
  }
}
