import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../core/shared/app_bar.dart';
import '../core/shared/app_button.dart';
import '../core/shared/app_dialog.dart';
import '../core/shared/app_header_text.dart';
import '../core/shared/app_selected_product.dart';
import '../core/shared/app_text_info.dart';
import '../core/theming/colors.dart';
import 'userinfo.dart';
import 'visa.dart';

class Placeorder extends StatefulWidget {
  const Placeorder({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.image,
  });
  final String image;
  final String name;
  final int price;
  final int quantity;
  final int totalPrice;

  @override
  State<Placeorder> createState() => _PlaceorderState();
}

class _PlaceorderState extends State<Placeorder> {
  dynamic savedAddress;
  dynamic savedCardInfo;
  int number = 1;
  int selectedquy = 1;
  onChanged(v) {
    setState(() {
      selectedquy = v;
    });
  }

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AppHeaderText(title: "Checkout", size: 22.sp, isSvg: true),
                  ),

                  Gap(15),
                  savedAddress == null
                      ? AppTextInfo(name: "Shipping adress")
                      : SizedBox.shrink(),
                  Gap(5),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.r),
                    child: Column(
                      children: [
                        savedAddress != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${savedAddress["first"]} ${savedAddress["last"]}"
                                        .toUpperCase(),
                                    style: TextStyle(
                                      color: Color(0xff1A1A1A),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20.sp,
                                      fontFamily: "TenorSans",
                                    ),
                                  ),
                                  Text(
                                    savedAddress["address"].toUpperCase(),
                                    style: TextStyle(
                                      color: Color(0xff555555),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                      fontFamily: "TenorSans",
                                    ),
                                  ),
                                  Gap(3),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        savedAddress["city"].toUpperCase(),
                                        style: TextStyle(
                                          color: Color(0xff555555),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                          fontFamily: "TenorSans",
                                        ),
                                      ),

                                      SvgPicture.asset(
                                        'assets/images/icons/Forward_right.svg',
                                        width: 8.w,
                                        color: Color(0xff333333),
                                      ),
                                    ],
                                  ),
                                  Gap(3),

                                  Text(
                                    savedAddress["state"].toUpperCase(),
                                    style: TextStyle(
                                      color: Color(0xff555555),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                      fontFamily: "TenorSans",
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),

                  Gap(10),
                  savedAddress == null
                      ? GestureDetector(
                          onTap: () async {
                            final data = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (c) => Userinfo()),
                            );
                            if (data != null) {
                              setState(() {
                                savedAddress = data;
                              });
                            }
                          },
                          child: Customselectedorder(
                            name: "Add shipping adress",
                            iconImage: 'assets/images/icons/Plus.svg',
                            isFree: false,
                          ),
                        )
                      : SizedBox.shrink(),

                  savedCardInfo != null
                      ? Column(
                          children: [
                            Divider(),
                            Gap(15),
                            Row(
                              children: [
                                Gap(10),
                                SvgPicture.asset(
                                  'assets/images/icons/MasterCard.svg',
                                ),
                                Gap(10),
                                Text(
                                  'Master Card ending  ••••${savedCardInfo["number"].toString().substring(savedCardInfo["number"].length - 2)}',
                                  style: TextStyle(
                                    fontFamily: "TenorSans",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff17181A),
                                  ),
                                ),
                              ],
                            ),
                            Gap(15),
                            Divider(),
                          ],
                        )
                      : SizedBox.shrink(),
                  savedCardInfo == null ? Gap(40) : SizedBox.shrink(),

                  savedCardInfo == null
                      ? AppTextInfo(name: 'Shipping Method')
                      : SizedBox.shrink(),

                  Gap(10),
                  savedCardInfo == null
                      ? Customselectedorder(
                          name: "Pickup at store",
                          iconImage: 'assets/images/icons/Forward_down.svg',
                          isFree: true,
                        )
                      : SizedBox.shrink(),
                  savedCardInfo == null ? Gap(40) : SizedBox.shrink(),

                  savedCardInfo == null || savedAddress == null
                      ? AppTextInfo(name: 'Payment method')
                      : SizedBox.shrink(),
                  Gap(10),

                  savedCardInfo == null
                      ? GestureDetector(
                          onTap: () async {
                            final data = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (c) => Visa()),
                            );
                            if (data != null) {
                              setState(() {
                                savedCardInfo = data;
                              });
                            }
                          },
                          child: Customselectedorder(
                            name: "Select payment method",
                            iconImage: 'assets/images/icons/Forward_down.svg',
                            isFree: false,
                          ),
                        )
                      : SizedBox.shrink(),
              
                  savedCardInfo == null || savedAddress != null
                      ? Gap(100)
                      : SizedBox.shrink(),
                  savedCardInfo != null ? Gap(100) : SizedBox.shrink(),
                  Row(
                    children: [
                      Text(
                        'Total'.toUpperCase(),
                        style: TextStyle(fontSize: 16.sp, letterSpacing: 5),
                      ),
                      Spacer(),
                      Text(
                        '\$ ${widget.totalPrice} ',
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

            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false , // مش عايزو يقفل لما ادوس علي اي مكان في الشاشه
                  builder: (context) {
                    return AppDialog();
                  },
                );
              },
              child: AppButton(name: 'Place order'),
            ),
          
          ],
        ),
      ),
    );
  }
}
