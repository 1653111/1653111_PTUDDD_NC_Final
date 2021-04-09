import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:q_final_project/home_screen/home_screen.dart';
import 'package:q_final_project/download_screen/download_screen.dart';
import 'package:q_final_project/browse_screen/browse_screen.dart';
import 'package:q_final_project/search_screen/search_screen.dart';

class Dashboard extends StatefulWidget {
  Dashboard({
    Key key,
  }) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int curIndex = 0;
  final List<Widget> children = [];

  @override
  void initState() {
    super.initState();
    children.add(HomeScreen());
    children.add(DownloadScreen());
    children.add(BrowseScreen());
    children.add(SearchScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: children[curIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            curIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        currentIndex: curIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_rounded),
            label: "Download",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows_rounded),
            label: "Browse",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
      ),
    );
  }
}
