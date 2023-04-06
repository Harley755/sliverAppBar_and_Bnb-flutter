import 'package:appbar_tabsbar/tabs/feeds_tab.dart';
import 'package:appbar_tabsbar/tabs/news_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // NESTEDSCROLLVIEW définit une vue de défilement qui contient un header et un body.
        body: NestedScrollView(
          // HEADER RETURN UNE LISTE DE WIDGET DE TYPE SLIVER
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                // l'AppBar flotte lors du défilement vers le haut,
                floating: true,
                // pinned est définie sur true pour que l'AppBar soit épinglée en haut lorsque le défilement atteint le haut de la vue.
                pinned: true,
                // snap est également définie sur true pour que l'AppBar se fixe rapidement en place lorsqu'elle est épinglée.
                snap: false,
                title: const Text('My App'),
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.red],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                ),
                bottom: TabBar(
                  dividerColor: Colors.grey,
                  indicatorWeight: 5.0,
                  indicatorColor: Colors.white,
                  tabs: [
                    const Tab(text: "Feed"),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("News"),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.photo_camera_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
                ],
              ),
            ];
          },
          // BODY
          body: const TabBarView(
            children: [
              FeedsTab(),
              NewsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
