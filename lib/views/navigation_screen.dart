import 'package:flutter/material.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/constants/constants.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  // Define your active and inactive icons
  final List<IconData> _inactiveIcons = [Icons.abc, Icons.catching_pokemon];
  final List<IconData> _activeIcons = [
    Icons.abc_outlined,
    Icons.catching_pokemon
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        backgroundColor: Colors.blue,
        body: const Center(
          child:
              Text("Home", style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
        appBar: AppBar(),
        bottomNavigationBar: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  paddingLarge, padding, paddingLarge, padding),
              child: Container(
                height: SizeUtils.width * .15,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(_inactiveIcons.length, (index) {
                    return _buildNavItem(index);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? _activeIcons[index] : _inactiveIcons[index],
            color: isSelected ? Colors.blue : Colors.grey,
          ),
          if (isSelected) // Optional label for selected item
            const Text(
              'Selected',
              style: TextStyle(color: Colors.blue),
            ),
        ],
      ),
    );
  }
}
