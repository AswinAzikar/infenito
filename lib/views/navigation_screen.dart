import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(
          child: Text("Home"),
        ),
        appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          
          
          
          
          items: const [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Abc"),
          BottomNavigationBarItem(
              icon: Icon(Icons.catching_pokemon), label: "pokey")
        ]),
      ),
    );
  }
}
