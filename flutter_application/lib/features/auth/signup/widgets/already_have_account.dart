import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../login/login_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account ?'  ,
          style: TextStyle(color: Colorss.primreColor, fontSize: 14.sp),
        ),
        TextButton(
          child: Text('Login', style: TextStyle(color: Colorss.primreColor , fontWeight: FontWeight.bold , fontSize: 14.sp)),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
          },
        ),
      ],
    );
  }
}
