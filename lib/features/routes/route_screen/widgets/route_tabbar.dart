import 'package:flutter/material.dart';

class RouteTabBar extends StatefulWidget {
  const RouteTabBar({super.key});

  @override
  _RouteTabBarState createState() => _RouteTabBarState();
}

class _RouteTabBarState extends State<RouteTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 231, 231, 231),
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: TabBar(
        indicatorPadding: const EdgeInsets.all(6),
        controller: _tabController,
        labelColor: const Color.fromARGB(255, 51, 50, 50), // цвет текста выбранного таба
        unselectedLabelColor: Color.fromARGB(255, 194, 194, 194), // цвет текста невыбранного таба
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 255, 255, 255)),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(
            text: 'Описание',
          ),
          Tab(
            text: 'Фотографии',
          ),
          Tab(
            text: 'Отзывы',
          ),
        ],
      ),
    );
  }
}