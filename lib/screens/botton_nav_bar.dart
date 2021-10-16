import 'package:dars40/screens/country_list.dart';
import 'package:dars40/screens/flag_page.dart';
import 'package:dars40/screens/home_page.dart';
import 'package:dars40/screens/search_page.dart';
import 'package:flutter/material.dart';

class WeartherBottomNavigatorBarPage extends StatefulWidget {
  const WeartherBottomNavigatorBarPage({Key? key}) : super(key: key);

  @override
  _WeartherBottomNavigatorBarPageState createState() =>
      _WeartherBottomNavigatorBarPageState();
}

class _WeartherBottomNavigatorBarPageState
    extends State<WeartherBottomNavigatorBarPage> {
  int _currentIndexBottomNavigatorBar = 0;
  List<Widget> _listOfPage = [];
  Widget? homePage, searchPage, contryPage, flagPage;
  @override
  void initState() {
    homePage = const HomePage();
    searchPage = const SearchPage();
    contryPage = const CountryPage();
    flagPage = const FlagPage();
    _listOfPage = [homePage!, searchPage!, contryPage!, flagPage!];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listOfPage[_currentIndexBottomNavigatorBar],
      bottomNavigationBar: _bottonNavigationbar(),
    );
  }

  Widget _bottonNavigationbar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ""),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_sharp),
          label: "",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard_rounded),
            label: ""),
        BottomNavigationBarItem(
          icon: Icon(Icons.golf_course),
          label: "",
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndexBottomNavigatorBar,
      selectedItemColor: Colors.green,
      iconSize: 30,
      onTap: (i) {
        setState(() {
          _currentIndexBottomNavigatorBar = i;
        });
      },
    );
  }
}