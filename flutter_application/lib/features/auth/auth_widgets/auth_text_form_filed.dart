import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final TextInputType keyboardType;
  final Widget icon;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final String? Function(String?) validator;
final Function(String)? onChanged;
  const AuthTextFormFiled({
    super.key,
    required this.controller,
    required this.hinttext,
    required this.keyboardType,
    required this.icon,
    required this.validator,
    this.isObscureText,
    this.suffixIcon, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
            validator: (value) {
        return validator(value);
      },
      controller: controller,
      obscureText: isObscureText ?? false,

      style: TextStyle(color: Colors.black),
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hinttext,
        suffixIcon: suffixIcon,

        hintStyle: TextStyle(fontFamily: "TenorSans", fontSize: 14.sp),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
