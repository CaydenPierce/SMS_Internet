import 'package:flutter/material.dart';

class TabedPage extends StatelessWidget {
  final List<Widget> pages;
  final List<Icon> icons;
  final String title;

  TabedPage(this.pages, this.icons, {this.title:"SMS Internet"});

  List<Widget> _getTabs() {
    List<Widget> tabs = [];
    for (Icon  icon in icons) {
      tabs.add(Tab(icon: icon));
    }
    return tabs;
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: pages.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            bottom: TabBar(
              tabs: _getTabs(),
            ),
          ),

          body: TabBarView(
            children: pages
          ),
        ),
      );
  }
}