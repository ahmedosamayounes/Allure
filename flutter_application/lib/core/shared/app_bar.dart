import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../theming/colors.dart';

import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  const Customappbar({super.key, required this.isblack});
  final bool isblack;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    bool isblackk = isblack;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        backgroundColor: isblackk ? Colorss.primreColor : Colors.white,
        leading: GestureDetector(
          onTap: () {
                  Scaffold.of(context).openDrawer(); 

          },
          child: SvgPicture.asset(
            'assets/images/icons/Menu.svg',
            color: isblackk ? Colors.white : Colors.black,
            height: 30,
            
          ),
        ),
        
        leadingWidth: 25,
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/homePhoto/Group 10285.svg',
          width: 50,
          
          color: isblackk ? Colors.white : Colors.black,
        ),
        actions: [
          SvgPicture.asset(
            'assets/images/icons/Search.svg',
            color: isblackk ? Colors.white : Colors.black,
          ),
          Gap(15),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: SvgPicture.asset(
              'assets/images/icons/shopping bag.svg',
              color: isblackk ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
