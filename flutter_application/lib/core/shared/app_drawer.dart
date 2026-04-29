import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200.w,
      backgroundColor: Colorss.primreColor,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colorss.logoColor,
                fontSize: 30.sp,
                fontFamily: "TenorSans",
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.home, color: Colorss.logoColor),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: "TenorSans",
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: Icon(Icons.logout, color: Colorss.logoColor),

            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontFamily: "TenorSans",
              ),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
