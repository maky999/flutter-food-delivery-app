import 'package:flutter/material.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
import 'package:flutter_app/pages/SignInPage.dart';
import 'package:flutter_app/widgets/BestFoodWidget.dart';
import 'package:flutter_app/widgets/BottomNavBarWidget.dart';
import 'package:flutter_app/widgets/PopularFoodsWidget.dart';
import 'package:flutter_app/widgets/SearchWidget.dart';
import 'package:flutter_app/widgets/TopMenus.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexTab = 0;
  List<Widget> _lsBody = [
    SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SearchWidget(),
          TopMenus(),
          PopularFoodsWidget(),
          BestFoodWidget(),
        ],
      ),
    ),
    Center(
      child: Text('Tab2'),
    ),
    Center(
      child: Text('Tab3'),
    ),
    Center(
      child: Text('Tab4'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
        title: Text(
          "What would you like to eat?",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Color(0xFF3a3737),
              ),
              onPressed: () {
                Navigator.push(context, ScaleRoute(page: SignInPage()));
              })
        ],
      ),
      body: IndexedStack(
        index: _indexTab,
        children: _lsBody,
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onUpdateTab: _onUpdateTab,
      ),
    );
  }

  _onUpdateTab(int tabIndex) {
    setState(() {
      _indexTab = tabIndex;
    });
  }
}
