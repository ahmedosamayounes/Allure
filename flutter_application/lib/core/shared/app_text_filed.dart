import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFiled extends StatelessWidget {
  const AppTextFiled({
    super.key,
    required this.name,
    required this.width,
    this.controller,
  });
  final String name;
  final double width;
  final TextEditingController? controller; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Fill The Field"; 
          }
          return null; 
        },

        decoration: InputDecoration(
          label: Text(
            name,
            style: TextStyle(
              color: Color(0xff979797),
              fontWeight: FontWeight.w500,
              fontFamily: "TenorSans",
            ),
          ),
        ),
      ),
    );
  }
}
