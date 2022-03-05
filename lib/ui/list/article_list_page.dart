import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:nintendo_news_app/ui/screens/login_screen.dart';
import 'package:nintendo_news_app/ui/screens/home_screen.dart';
import 'package:nintendo_news_app/ui/screens/myarticles_screen.dart';
import 'package:nintendo_news_app/ui/screens/settings_screen.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({Key key}) : super(key: key);

  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nintendo Today'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.login),
          ),
        ],
      ),
      body: buildPages(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    const activeColor = Colors.white;

    return BottomNavyBar(
      backgroundColor: Colors.red,
      selectedIndex: index,
      onItemSelected: (index) => setState(() => this.index = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.home),
          title: const Text('Home'),
          textAlign: TextAlign.center,
          activeColor: activeColor,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.article),
          title: const Text('My Articles'),
          textAlign: TextAlign.center,
          activeColor: activeColor,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.settings),
          title: const Text('Settings'),
          textAlign: TextAlign.center,
          activeColor: activeColor,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.account_circle_rounded),
          title: const Text('Account'),
          textAlign: TextAlign.center,
          activeColor: activeColor,
        ),
      ],
    );
  }

  Widget buildPages() {
    switch (index) {
      case 1:
        return MyArticles();
      case 2:
        return SettingsPage();
      case 3:
        return LoginPage();
      case 0:
      default:
        return HomePage();
    }
  }
}
