import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarWidget extends StatefulWidget {
  final Function(int) onUpdateTab;

  BottomNavBarWidget({@required this.onUpdateTab});

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // navigateToScreens(index);
      widget?.onUpdateTab(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          /*title: Text(
            'Home',
            style: TextStyle(color: Color(0xFF2c2b2b)),
          ),*/
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.near_me),
          /* title: Text(
            'Near By',
            style: TextStyle(color: Color(0xFF2c2b2b)),
          ),*/
          label: 'Near By',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_giftcard),
          /*   title: Text(
            'Cart',
            style: TextStyle(color: Color(0xFF2c2b2b)),
          ),*/
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.user),
          /*        title: Text(
            'Account',
            style: TextStyle(color: Color(0xFF2c2b2b)),
          ),*/
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFFfd5352),
      onTap: _onItemTapped,
    );
  }
}
