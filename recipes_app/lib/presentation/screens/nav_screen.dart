import 'package:flutter/material.dart';
import 'package:recipes_app/presentation/screens/home_screen.dart';

import '../view_model/nav_view_model.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({
    super.key,
  });

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
        stream: navViewModel.pageIndexStream,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          List<Widget> pages = [
            const HomeScreen(),
            Container(color: Colors.green),
          ];

          return IndexedStack(
            index: snapshot.data ?? 0,
            children: pages,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int index) {
          navViewModel.setPageIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }
}
