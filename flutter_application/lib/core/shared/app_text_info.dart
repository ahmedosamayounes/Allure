import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextInfo extends StatelessWidget {
  const AppTextInfo({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name.toUpperCase(),
      style: TextStyle(
        color: Color(0xff888888),
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        fontFamily: "TenorSans",
        letterSpacing: 2,
      ),
    );
  }
}
