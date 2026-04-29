import 'package:flutter/material.dart';
import '../../../core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AuthHeader extends StatelessWidget {
  final String name;
  final String description;
  const AuthHeader({super.key, required this.name, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(20.h),
        Center(
          child: SvgPicture.asset(
            'assets/images/homePhoto/Allure.svg',
            height: 70.h,
          ),
        ),
        Gap(30.h),

        Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "TenorSans",
            color: Colorss.primreColor,
            fontSize: 30.sp,
          ),
        ),
        Gap(8.h),
        Text(
          description,
          style: TextStyle(fontFamily: "TenorSans", fontSize: 13.sp),
        ),
      ],
    );
  }
}
