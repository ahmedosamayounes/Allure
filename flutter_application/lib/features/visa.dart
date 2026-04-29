import 'package:flutter/material.dart';
import '../core/shared/app_bar.dart';
import '../core/shared/app_button.dart';
import '../core/shared/app_header_text.dart';

import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Visa extends StatefulWidget {
  const Visa({super.key});

  @override
  State<Visa> createState() => _VisaState();
}

class _VisaState extends State<Visa> {
  final TextEditingController cardnum = TextEditingController();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isShow = false;

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      }, // بتخلي الكيبورد لما افتح الفورم ينزل لتحت
      child: Scaffold(
        appBar: Customappbar(isblack: false),
        body: Padding(
          padding:  EdgeInsets.all(15.0.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: AppHeaderText(
                    title: "Payment method",
                    size: 22.sp,
                    isSvg: true,
                  ),
                ),

                Gap(13),

                // Visa
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isShow,
                  onCreditCardWidgetChange: (v) {},
                  cardBgColor: Colors.black,
                  isHolderNameVisible: true, // بتخلي الاسم يظهر
                  // لون الفيزا
                ),

                CreditCardForm(
                  formKey: _key,

                  cardNumber: cardNumber,

                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  isCardHolderNameUpperCase: true, // لما يكتب الاسم يظهر كابتل
                ),
                Gap(54.h),

                GestureDetector(
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      Navigator.pop(context, {
                        "number": cardNumber,
                        "name": cardHolderName,
                        "data": expiryDate,
                        "cvv": cvvCode,
                      });
                    }
                  },

                  child: AppButton(name: 'add card '),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // دي فانكشن بتخليني كل ما اكتب حاجه تظهر في الفيزا

  void onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      cardNumber = data.cardNumber;
      cardHolderName = data.cardHolderName;
      cvvCode = data.cvvCode;
      expiryDate = data.expiryDate;
      isShow = data.isCvvFocused;
    });
  }
}
