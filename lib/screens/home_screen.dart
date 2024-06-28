import 'package:flutter/material.dart';
import 'package:wallet_app/screens/profile_screen.dart';
import 'package:wallet_app/screens/log_out_screen.dart';
import 'package:wallet_app/screens/wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //initialising index of tab list
  int _selectedIndex = 0;

  //tabs for wallet app
  static const List<Widget> _tabList = <Widget>[
    WalletScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _tabList.elementAt(_selectedIndex),
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.logout_rounded), label: 'Logout'),
        ],
         currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onTap,
      
        ),
      ),
    );
  }
}
