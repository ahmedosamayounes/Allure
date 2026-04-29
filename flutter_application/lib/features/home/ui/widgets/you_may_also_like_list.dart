import 'package:flutter/material.dart';
import 'cover.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class YouMayAlsoLikeList extends StatelessWidget {
  const YouMayAlsoLikeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'YOU MAY ALSO LIKE '.toUpperCase(),
          style: TextStyle(
            color: Color(0xffFCFCFC),
            fontSize: 23.sp,
            letterSpacing: 2,

            fontFamily: "TenorSans",
          ),
        ),
        Gap(5.h),
        SvgPicture.asset('assets/images/icons/12.svg', color: Colors.white),
        Gap(30.h),
        SizedBox(
          // if ListView do not work give him a size
          height: 400.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Cover.products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.all(8.0.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Cover.products[index].image,
                      fit: BoxFit.cover,
                      height: 340.h,
                    ),
                    Gap(10),
                    Text(
                      Cover.products[index].name.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "TenorSans",
                        letterSpacing: 2,
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
