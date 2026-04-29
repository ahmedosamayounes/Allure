import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../signup/signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account ?', style: TextStyle(color: Colors.black , fontSize: 14.sp)),
        TextButton(
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colorss.primreColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SignUp()),
            );
          },
        ),
      ],
    );
  }
}
