import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 230, 227, 227),
      height: 45.h,
      width: double.infinity,
      child: Center(
        child: Text(
          'Copyright© OpenUI All Rights Reserved.',
          style: TextStyle(color: Color(0xff555555)),
        ),
      ),
    );
  }
}
