import 'package:flutter/material.dart';
import 'app_header_text.dart';
import '../theming/colors.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AppProductCard extends StatefulWidget {
  const AppProductCard({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.onChanged,
  });
  final String image;
  final String name;
  final int price;
  final Function(int) onChanged;

  @override
  State<AppProductCard> createState() => _CustomproductState();
}

class _CustomproductState extends State<AppProductCard> {
     int number = 1;

  int selectedquy = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(widget.image, width: 150.w),
        Gap(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            AppHeaderText(title: widget.name, size: 20.sp , isSvg: false,),
            Gap(5),
        
            Gap(20),

            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (number == 1) {
                        number == 1;
                      } else {
                        number--;
                       widget.onChanged(number);
                      }
                    });
                  },
                  child: Container(
                    width: 30.w,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Color(0xffC4C4C4)),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/icons/mins.svg',
                      color: Colors.black,
                    ),
                  ),
                ),
                Gap(10),
                Text(
                  number.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
                Gap(10),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      number++;
                       widget.onChanged(number);
                    });
                  },
                  child: Container(
                    width: 30.w,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Color(0xffC4C4C4)),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/icons/Plus (1).svg',
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Gap(40.h),
            Text(
              '\$ ${widget.price }',
              style: TextStyle(
                color: Colorss.priceColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                fontFamily: "TenorSans",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
