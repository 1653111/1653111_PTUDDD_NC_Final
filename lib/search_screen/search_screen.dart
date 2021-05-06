import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_final_project/home_screen/top_new.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Search'),
        actions: [searchBar.getSearchAction(context)]);
  }

  _SearchScreenState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: searchBar.build(context));
  }
}
