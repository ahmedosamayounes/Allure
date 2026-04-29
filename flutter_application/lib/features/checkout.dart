import 'package:flutter/material.dart';
import '../core/shared/app_bar.dart';
import '../core/shared/app_button.dart';
import '../core/shared/app_header_text.dart';
import '../core/shared/app_product_card.dart';
import '../core/theming/colors.dart';
import 'placeorder.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Checkout extends StatefulWidget {
  const Checkout({
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
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int selectedquy = 1;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(isblack: false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(15.0.r),
              child: Column(
                children: [
                  Center(
                    child: AppHeaderText(title: "Checkout", size: 33.sp, isSvg: true),
                  ),

                  Gap(15),

                  AppProductCard(
                    image: widget.image,
                    name: widget.name,
                    price: widget.price,
                    onChanged: (v){
                      setState(() {
                        selectedquy = v;
                      });
                    },

                  ),
                  Gap(20),
                  Divider(),
                  Gap(15),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.r),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/icons/Voucher.svg',
                          height: 30.h,
                        ),
                        Gap(10),
                        Text(
                          'Add Promo Code',
                          style: TextStyle(
                            fontFamily: "TenorSans",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Gap(15),
                        Divider(),
                        Gap(15),
                      ],
                    ),
                  ),
                  Gap(15),
                  Divider(),
                  Gap(15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/icons/delviery.svg',
                          height: 30.h,
                        ),
                        Gap(10),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.r),
                          child: Text(
                            'Delivery',
                            style: TextStyle(
                              fontFamily: "TenorSans",
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'FREE',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            fontFamily: "TenorSans",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(10),
                  Divider(),
                  Gap(78.h),
                  Row(
                    children: [
                      Text(
                        'Est. Total'.toUpperCase(),
                        style: TextStyle(fontSize: 16.sp, letterSpacing: 5),
                      ),
                      Spacer(),
                      Text(
                        '\$ ${widget.price * selectedquy}',
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
              ),
            ),
            Gap(35.h),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => Placeorder(
                      image: widget.image,
                      name: widget.name,
                      price: widget.price,
                      quantity: selectedquy,
                      totalPrice: selectedquy * widget.price,
                    ),
                  ),
                );
              },

              child: AppButton(name: 'Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
// here