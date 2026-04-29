import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

class SocialMediaContact extends StatelessWidget {
  const SocialMediaContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.sp,
      width: double.infinity,
      color: Colorss.primreColor,
      child: Column(
        children: [
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Ionicons.logo_twitter, color: Colors.white),
              Gap(40.h),
              Icon(Ionicons.logo_facebook, color: Colors.white),
              Gap(40.h),
              Icon(Ionicons.logo_instagram, color: Colors.white),
            ],
          ),
          Gap(30.h),
          SvgPicture.asset(
            'assets/images/icons/12.svg',
            width: 150.w,
            color: Colors.white,
          ),
          Gap(20),
          Text(
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "TenorSans",
              color: Colors.white,
              height: 2.5.h,
            ),
            'support@openui.design\n        +60 825 876\n08:00 - 22:00 - Everyday',
          ),
          Gap(20),
          SvgPicture.asset(
            'assets/images/icons/12.svg',
            width: 150.w,
            color: Colors.white,
          ),
          Gap(30.h),
          Container(
            width: 240.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'About ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: "TenorSans",
                  ),
                ),
                Text(
                  'Contact',
                  style: TextStyle(
                    color: Colors.white,
            
                    fontSize: 18.sp,
                    fontFamily: "TenorSans",
                  ),
                ),
                Text(
                  'Blog',
                  style: TextStyle(
                    color: Colors.white,
            
                    fontSize: 18.sp,
                    fontFamily: "TenorSans",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
