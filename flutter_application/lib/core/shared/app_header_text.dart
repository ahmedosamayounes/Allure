import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AppHeaderText extends StatelessWidget {
  const AppHeaderText({super.key, required this.title, required this.size, required this.isSvg });
  final String title;
  final double size;
 final bool isSvg ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(30.h),

        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontFamily: "TenorSans",
            letterSpacing: 5,
            fontSize: size,
            fontWeight: FontWeight.w500,
          ),
        ),
        isSvg
       ? SvgPicture.asset(
          'assets/images/icons/12.svg',
          color: Colors.black,
          width: 160.w,
        )
        :SizedBox.shrink()
      ],
    );
  }
}
