import 'package:flutter/material.dart';

import 'package:nuews/view/tabs/apple_tab.dart';
import 'package:nuews/view/tabs/domains_wiget.dart';
import 'package:nuews/view/tabs/headlines_wigat.dart';
import 'package:nuews/view/tabs/techcrunch_wiget.dart';
import 'package:nuews/view/tabs/tesla_wiget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("API"),
          bottom: TabBar(controller: tabController, tabs: const [
            Tab(text: "Tesla"),
            Tab( text: "Apple"),

            Tab(text: "Techcrunch"),
            Tab(text: "Headlines"),
            Tab(text: "Domains"),
          ]),
        ),
        body: TabBarView(controller: tabController,children: _tabs));
  }

  final List<Widget> _tabs = [
    const TeslaWiget(),
    const AppleWiget(),
    const Tech(),
     const Headlines(),
    const Domains(),
   
  ];
}
