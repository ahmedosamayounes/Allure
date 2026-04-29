import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  final String name;
final void Function()? onTap;
  final bool isLoading;

  const AuthButton({
    super.key,
    required this.name,
    required this.onTap,
   required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: isLoading ? null : onTap,

      child: isLoading
          ? Center(child: const CircularProgressIndicator(color: Colors.black,))
          : Container(
              width: double.infinity.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.r),
                color: Colors.black,
              ),
              
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontFamily: "TenorSans",
                  ),
                ),
              ),
            ),
    );
  }
}
