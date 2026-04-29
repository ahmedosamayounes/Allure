import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginWith extends StatelessWidget {
  final String name;
  final void Function()? onPressed;
  const LoginWith({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                side: BorderSide(color: Color(0xff7A7A7A)),
                borderRadius: BorderRadius.circular(30.r))),
          ),
          onPressed: onPressed,
          child: Row(
            children: [
             Image.asset('assets/images/homePhoto/Frame 27104.png' , width: 30.w),
              Gap(10.h),
              Text(
                'Login through $name',
                style: TextStyle(color: Color(0xff7A7A7A), fontSize: 14.sp),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
