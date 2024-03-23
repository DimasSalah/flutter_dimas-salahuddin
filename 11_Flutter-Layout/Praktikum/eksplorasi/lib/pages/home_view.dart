import 'package:flutter/material.dart';

import '../component/list_tile_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00A8E8),
        title: const Text(
          "Alta - Widget Layout - Exploration",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ListTileCard(
              title: 'Learn Flutter',
            ),
            ListTileCard(
              title: 'Learn Dart',
            ),
            ListTileCard(
              title: 'Learn Android',
            ),
            ListTileCard(
              title: 'Learn iOS',
            ),
            ListTileCard(
              title: 'Learn Web',
            ),
            ListTileCard(
              title: 'Learn Desktop',
            ),
            ListTileCard(
              title: 'Learn Embedded',
            ),
            ListTileCard(
              title: 'Learn Cloud',
            ),
            ListTileCard(
              title: 'Learn AI',
            ),
            ListTileCard(
              title: 'Learn IoT',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, color: Colors.white,),
        backgroundColor: Color(0xFFA8E800),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Information',
          ),
      ],),
    );
  }
}


