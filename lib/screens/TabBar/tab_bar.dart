import 'package:flutter/material.dart';

class TabBarScreens extends StatefulWidget {
  const TabBarScreens({super.key});

  @override
  State<TabBarScreens> createState() => _TabBarScreensState();
}

class _TabBarScreensState extends State<TabBarScreens> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.blue.shade300,
        appBar: AppBar(
          title: Text('My Tabs',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TabBar(
                    labelColor: Colors.black,
                      indicator: BoxDecoration(
                        color: Colors.blue.shade600,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(
                        text: 'Home',
                        icon: Icon(Icons.home),
                      ),
                      Tab(
                        text: 'Search',
                        icon: Icon(Icons.search),
                      ),
                      Tab(
                        text: 'Profile',
                        icon: Icon(Icons.person),
                      ),
                    ],
                  ),
                ),
              )
          ),
        ),
        body: TabBarView(
            children: [
              TabContent(title: 'Home Screen'),
              TabContent(title: 'Search Screen'),
              TabContent(title: 'Profile Screen'),
            ]
        ),
      ),
    );
  }
}

class TabContent extends StatelessWidget {
  final String title;

  const TabContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title,style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w700
      ),),
    );
  }
}
