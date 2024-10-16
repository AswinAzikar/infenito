import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infenito/Utils/size_utils.dart';
import 'package:infenito/constants/constants.dart';
import 'package:infenito/gen/assets.gen.dart';
import 'package:infenito/themes/app_text_style.dart';
import 'package:infenito/themes/themes.dart';
import 'package:infenito/views/home_screen.dart';
import 'package:infenito/widgets/glass_morphic_container.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final List<SvgPicture> _inactiveIcons = [
    SvgPicture.asset(Assets.svgs.home),
    SvgPicture.asset(Assets.svgs.profile),
    SvgPicture.asset(Assets.svgs.wallet),
    SvgPicture.asset(Assets.svgs.delete),
    SvgPicture.asset(Assets.svgs.message)
  ];
  final List<SvgPicture> _activeIcons = [
    SvgPicture.asset(Assets.svgs.homeActive),
    SvgPicture.asset(Assets.svgs.profileActive),
    SvgPicture.asset(Assets.svgs.walletActive),
    SvgPicture.asset(Assets.svgs.deleteActive),
    SvgPicture.asset(Assets.svgs.messageActive)
  ];

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(
        child: Text("Profile Screen", style: TextStyle(color: Colors.white))),
    const Center(
        child: Text("Wallet Screen", style: TextStyle(color: Colors.white))),
    const Center(
        child: Text("delete Screen", style: TextStyle(color: Colors.white))),
    const Center(
        child:
            Text("Notification Screen", style: TextStyle(color: Colors.white)))
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      //  backgroundColor: Colors.brown[100],
      body: Stack(
        children: [
          SizedBox(
            height: SizeUtils.height,
            child: Image.asset(
              Assets.pngs.signupBg.path,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: SizeUtils.height,
            child: SvgPicture.asset(
              Assets.svgs.linearCoffeeGradient,
              fit: BoxFit.cover,
            ),
          ),
          GlassmorphicContainer(
              borderColor: Colors.transparent,
              backgroundColorOpacity: .45,
              backgroundColor: const Color(0xff313131),
              borderThickness: 0,
              child: SizedBox(
                height: SizeUtils.height,
                width: SizeUtils.width,
              )),
          SizedBox(
            child: SvgPicture.asset(
              height: SizeUtils.height,
              Assets.svgs.grainy,
              fit: BoxFit.fill,
            ),
          ),
          _pages[_selectedIndex],
        ],
      ),
      //     appBar: AppBar(),
      bottomNavigationBar: Container(
        height: SizeUtils.width * .16,
        margin: EdgeInsets.fromLTRB(
            SizeUtils.width * .04,
            SizeUtils.width * .05,
            SizeUtils.width * .04,
            SizeUtils.width * .05),
        decoration: BoxDecoration(
          color: const Color(0xff333333).withOpacity(0.3),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              paddingLarge,
            ),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(paddingLarge)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff333333).withOpacity(.4),
                borderRadius:
                    const BorderRadius.all(Radius.circular(paddingLarge)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_inactiveIcons.length, (index) {
                  return _buildNavItem(index);
                }),
              ),
            ),
          ),
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
          isSelected ? _activeIcons[index] : _inactiveIcons[index],
        ],
      ),
    );
  }
}
