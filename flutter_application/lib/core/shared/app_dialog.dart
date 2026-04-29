import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theming/colors.dart';
import '../../features/home/ui/home.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 470.h,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                child: Icon(CupertinoIcons.clear),
                alignment: Alignment.topRight,
              ),
            ),
            Gap(30),
            Text(
              'Payment success'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                fontFamily: "TenorSans",
                letterSpacing: 4,
              ),
            ),
            Gap(20),
            SvgPicture.asset('assets/images/icons/done.svg'),
            Gap(20),
            Text(
              'Your payment was success',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                fontFamily: "TenorSans",
              ),
            ),
            Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Payment ID'), Gap(5), Text('15263541')],
            ),
            Gap(20),
            SvgPicture.asset(
              'assets/images/icons/12.svg',
              color: Colors.black,
            ),
            Gap(20),
            Text(
              'Rate your purchase',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.sp,
                fontFamily: "TenorSans",
              ),
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/Disappointed.png',
                  color: Colorss.priceColor,
                ),
                Gap(5),
                Image.asset(
                  'assets/images/icons/Happy.png',
                  color: Colorss.priceColor,
                ),
                Gap(5),
                Image.asset(
                  'assets/images/icons/In Love.png',
                  color: Colorss.priceColor,
                ),
              ],
            ),
            Gap(50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(builder: (context) => Home()),
                    );
                  },
                  child: Container(
                    width: 120.w,
                    height: 35.h,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        'Submit'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "TenorSans",
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Gap(10),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 120.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1.w,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Back'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "TenorSans",
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
