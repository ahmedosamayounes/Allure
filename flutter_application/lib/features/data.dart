import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Data extends StatelessWidget {
  const Data({super.key, required this.firstname});
  final String firstname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(firstname , style: TextStyle(color: Colors.red , fontSize: 30.sp),)),
        ],
      ),
    );
  }
}