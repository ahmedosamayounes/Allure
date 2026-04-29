import 'package:flutter/material.dart';
import '../core/shared/app_bar.dart';
import '../core/shared/app_button.dart';
import '../core/shared/app_header_text.dart';
import '../core/shared/app_text_filed.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Userinfo extends StatefulWidget {
  const Userinfo({super.key});

  @override
  State<Userinfo> createState() => _UserinfoState();
}

class _UserinfoState extends State<Userinfo> {
  final _formKey = GlobalKey<FormState>();

  // هنا الكنترولرز لكل TextField
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(isblack: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Form(
                key: _formKey, // ربط الفورم بالمفتاح

                child: Column(
                  children: [
                    Center(
                      child: AppHeaderText(title: "Add shipping adress", size: 20.sp , isSvg: true,),
                    ),
                    Gap(30),

                    Row(
                      children: [
                        AppTextFiled(
                          name: "First name",
                          width: 120.w,
                          controller: firstNameController,
                        ),
                        Gap(15),
                        AppTextFiled(
                          name: "Last name",
                          width: 120.w,
                          controller: lastNameController,
                        ),
                      ],
                    ),

                    Gap(15),
                    AppTextFiled(
                      name: "Address",
                      width: double.infinity,
                      controller: addressController,
                    ),

                    Gap(15),
                    AppTextFiled(
                      name: "City",
                      width: double.infinity,
                      controller: cityController,
                    ),

                    Gap(15),
                    Row(
                      children: [
                        AppTextFiled(
                          name: "State",
                          width: 120.w,
                          controller: stateController,
                        ),
                        Gap(15),
                        AppTextFiled(
                          name: "ZIP code",
                          width: 120.w,
                          controller: zipController,
                        ),
                      ],
                    ),

                    Gap(15),
                    AppTextFiled(
                      name: "Phone number",
                      width: double.infinity,
                      controller: phoneController,
                    ),
                  ],
                ),
              ),
              Gap(80.h),

              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, {
                      "first": firstNameController.text,
                      "last": lastNameController.text,
                      "address": addressController.text,
                      "city": cityController.text,
                      "state": stateController.text,
                    });
                  }
                },

                child: AppButton(name: "Place Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
