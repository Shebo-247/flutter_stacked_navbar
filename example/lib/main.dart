import 'package:flutter/material.dart';
import 'package:flutter_stacked_navbar/flutter_stacked_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stacked Navbar Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  List<String> pages = [
    "Home",
    "Favorites",
    "Chat",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Flutter Stacked Navbar Demo')),
      body: Center(child: Text(pages[currentIndex])),
      bottomSheet: StackedNavbar(
        height: 100,
        navItems: [
          NavItem(
            title: "Home",
            icon: Icon(Icons.home_outlined),
            iconSelected: Icon(Icons.home, color: Colors.white),
          ),
          NavItem(
            title: "Favorites",
            icon: Icon(Icons.favorite_border),
            iconSelected: Icon(Icons.favorite, color: Colors.white),
          ),
          NavItem(
            title: "Chat",
            icon: Icon(Icons.chat_bubble_outline),
            iconSelected: Icon(Icons.chat_bubble, color: Colors.white),
          ),
          NavItem(
            title: "Settings",
            icon: Icon(Icons.settings_outlined),
            iconSelected: Icon(Icons.settings, color: Colors.white),
          ),
        ],
        activeLabelColor: Colors.blueGrey,
        inactiveLabelColor: Colors.black,
        activeNavColor: Colors.blueGrey,
        initialPage: currentIndex,
        onTabClicked: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
