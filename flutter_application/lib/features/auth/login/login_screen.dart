// ignore_for_file: unnecessary_nullable_for_final_variable_declarations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/helpers/app_regex.dart';
import 'package:flutter_application/core/theming/colors.dart';
import 'package:flutter_application/features/auth/auth_networking/auth_service.dart';
import 'package:flutter_application/features/auth/auth_widgets/auth_button.dart';
import 'package:flutter_application/features/auth/auth_widgets/auth_header.dart';
import 'package:flutter_application/features/auth/auth_widgets/auth_text_form_filed.dart';
import 'package:flutter_application/features/auth/login/widgets/do_not_have_account.dart';
import 'package:flutter_application/features/auth/login/widgets/login_wih.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isObscureText = true;
  bool isLoading = false;
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(12.r),
            child: Form(
              key: _formKey,

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthHeader(
                      name: 'Welcome Back',
                      description:
                          'Great to see you again — let’s get you signed in',
                    ),
                    Gap(50.h),

                    //Email Adreess
                    AuthTextFormFiled(
                      controller: _emailController,
                      hinttext: 'Email Adreess',

                      keyboardType: TextInputType.emailAddress,
                      icon: Icon(Icons.email_outlined),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !AppRegex.isEmailValid(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),

                    Gap(20.h),

                    //Password
                    AuthTextFormFiled(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      isObscureText: isObscureText,

                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                          isObscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      hinttext: 'Password',
                      icon: Icon(Icons.lock_outline),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid password';
                        }

                        return null;
                      },
                    ),
                    Gap(30.h),

                    //Login Button
                    AuthButton(
                      isLoading: isLoading,
                      name: 'Login',

                      onTap: () async {
                        if (!_formKey.currentState!.validate()) return;
                        if (!mounted) return;
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          final userCredential = await _authService.login(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                          print("SUCCESS: ${userCredential.user}");
                        } on FirebaseAuthException catch (e) {
                          print("ERRORrrrrrrrrrrr: $e");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colorss.primreColor,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              content: Text(
                                e.message ?? 'Login failed',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        } finally {
                          if (!mounted) return;
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),

                    Gap(20.h),
                    Center(
                      child: Text('OR ', style: TextStyle(fontSize: 16.sp)),
                    ),
                    Gap(15.h),
                    LoginWith(
                      name: 'Google ',
                      onPressed: isLoading
                          ? null
                          : () async {
                              if (!mounted) return;
                              setState(() {
                                isLoading = true;
                              });
                              try {
                                await _authService.signInWithGoogle();
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colorss.primreColor,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(20),
                                    ),
                                    content: Text(
                                      'Google sign-in failed',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              } finally {
                                if (!mounted) return;
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                    ),
                    Gap(10.h),
                    DoNotHaveAccount(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
