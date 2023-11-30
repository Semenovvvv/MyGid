import 'package:flutter/material.dart';

class ProfileTabBar extends StatefulWidget {
  const ProfileTabBar({super.key});

  @override
  _ProfileTabBarState createState() => _ProfileTabBarState();
}

class _ProfileTabBarState extends State<ProfileTabBar> with SingleTickerProviderStateMixin {
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
      height: 20,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 231, 231, 231),
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: TabBar(
        indicatorPadding: EdgeInsets.all(6),
        controller: _tabController,
        labelColor: const Color.fromARGB(255, 51, 50, 50), // цвет текста выбранного таба
        unselectedLabelColor: Color.fromARGB(255, 194, 194, 194), // цвет текста невыбранного таба
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 255, 255, 255)),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        tabs: const [
          Tab(
            text: 'Маршруты',
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