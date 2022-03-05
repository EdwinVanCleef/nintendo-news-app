import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:google_fonts/google_fonts.dart';
import 'package:nintendo_news_app/ui/app_colors.dart';
import 'package:nintendo_news_app/ui/list/article_list_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NintendoApp());
}

class NintendoApp extends StatelessWidget {
  const NintendoApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w700BitterFont = GoogleFonts.bitter(
      fontWeight: FontWeight.w700,
    );

    return MaterialApp(
      title: 'nintendonewsapp',
      theme: ThemeData(
        primarySwatch: AppColors.red,
        accentColor: AppColors.green,
        buttonColor: AppColors.green,
        scaffoldBackgroundColor: AppColors.grey,
        backgroundColor: AppColors.grey,
        primaryTextTheme: TextTheme(
          headline6: w700BitterFont,
        ),
        textTheme: TextTheme(
          subtitle1: w700BitterFont.apply(color: AppColors.red),
          headline6: w700BitterFont.apply(color: AppColors.red),
          bodyText2: TextStyle(color: AppColors.black),
        ),
      ),
      home: const ArticleListScreen(),
    );
  }
}
