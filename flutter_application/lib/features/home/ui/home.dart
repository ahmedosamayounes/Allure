// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application/core/shared/app_bar.dart';
import 'package:flutter_application/core/shared/app_drawer.dart';
import 'package:flutter_application/core/theming/colors.dart';
import 'package:flutter_application/features/checkout.dart';
import 'package:flutter_application/features/home/networking/home_service.dart';
import 'package:flutter_application/features/home/ui/widgets/footer.dart';
import 'package:flutter_application/features/home/ui/widgets/social_media_contact.dart';
import 'package:flutter_application/features/home/ui/widgets/you_may_also_like_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Home extends StatelessWidget {
  final HomeService _homeService = HomeService();
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        backgroundColor: Colorss.primreColor,
        appBar: Customappbar(isblack: true),
        body: StreamBuilder<QuerySnapshot>(
          stream: _homeService.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
            if (snapshot.hasError || !snapshot.hasData) {
              return Center(
                child: Text(
                  'Database Error ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontFamily: "TenorSans",
                  ),
                ),
              );
            }
            final docsData = snapshot.data!.docs;
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 30,
                  left: 0,
                  bottom: 570,
                  child: Image.asset('assets/images/homePhoto/10.png'),
                ),
                Positioned(
                  top: 85,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    'assets/images/homePhoto/Collection.svg',
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 0,
                  left: 0,
                  child: SvgPicture.asset(
                    'assets/images/homePhoto/Allure.svg',
                    width: 180,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0.r),
                        child: Column(
                          children: [
                            Gap(120.h),
                            Stack(
                              children: [
                                Image.asset(
                                  'assets/images/homePhoto/image (7).png',
                                ),
                                Positioned(
                                  top: 300,
                                  right: 0,
                                  left: 200,
                                  bottom: 0,
                                  child: Image.asset(
                                    'assets/images/homePhoto/10.png',
                                  ),
                                ),
                              ],
                            ),
                            Gap(20),
                            GridView.builder(
                              // use this shrinkWrap / physics , if there error code has size
                              shrinkWrap: true,
                              // here we say do not scroll , we cannot scrool by GridView inside Column
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: docsData.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    childAspectRatio: 1 / 2,
                                  ),
                              itemBuilder: (context, index) {
                                final data =
                                    docsData[index].data()
                                        as Map<String, dynamic>;
                                return GestureDetector(
                                  onTap: () async {
                                    final imageUrl = await _homeService
                                        .getImageUrl(data['image']);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (context) => Checkout(
                                          image: imageUrl,
                                          name: data['product_name'],

                                          price: data['product_price'],

                                          onChanged: (int p1) {},
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          FutureBuilder<String>(
                                            future: _homeService.getImageUrl(
                                              data['image'].toString(),
                                            ),
                                            builder: (context, snapshot) {
                                              print(snapshot.error);

                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return SizedBox(
                                                  height: 200.h,

                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                );
                                              }

                                              if (snapshot.hasError) {
                                                return SizedBox(
                                                  height: 200.h,

                                                  child: Center(
                                                    child: Text(
                                                      'Error loading image',

                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 10.sp,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              if (!snapshot.hasData) {
                                                return SizedBox(
                                                  height: 200.h,
                                                  child: Center(
                                                    child: Text('No Image'),
                                                  ),
                                                );
                                              }

                                              return Image.network(
                                                snapshot.data!,
                                                fit: BoxFit.cover,
                                                width: 230.w,
                                                height: 200.h,
                                              );
                                            },
                                          ),
                                          Positioned(
                                            bottom: 8,
                                            right: 10,
                                            child: SvgPicture.asset(
                                              'assets/images/icons/Heart.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(8),
                                      Text(
                                        'Octobar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "TenorSans",
                                          fontSize: 15.sp,
                                        ),
                                      ),

                                      Gap(8),
                                      Text(
                                        data['product_name'],
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontFamily: "TenorSans",
                                          fontSize: 12.sp,
                                        ),
                                        maxLines: 1,
                                      ),

                                      Text(
                                        '\$ ${data['product_price']}.0',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          color: Colorss.priceColor,
                                          fontFamily: "TenorSans",
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            Gap(20),
                            YouMayAlsoLikeList(),
                            Gap(50),
                            SocialMediaContact(),
                          ],
                        ),
                      ),
                      Footer(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
