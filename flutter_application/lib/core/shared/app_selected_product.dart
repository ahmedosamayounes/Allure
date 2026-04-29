import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Customselectedorder extends StatelessWidget {
  const Customselectedorder({
    super.key,
    required this.name,
    required this.iconImage,
    this.isFree = true,
  });

  final String name;
  final String iconImage;
  final bool isFree;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(20.r),
      ),

      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.r),
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(
                color: Color(0xff555555),
                fontSize: 19.sp,
                fontFamily: "TenorSans",
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            isFree
                ? Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.r),
                    child: Text(
                      'FREE',
                      style: TextStyle(
                        fontFamily: "TenorSans",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff555555),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            SvgPicture.asset(iconImage, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
