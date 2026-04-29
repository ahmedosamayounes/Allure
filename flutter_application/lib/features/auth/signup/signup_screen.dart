import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/app_regex.dart';
import '../../../core/theming/colors.dart';
import '../auth_networking/auth_service.dart';
import '../auth_widgets/auth_button.dart';
import '../auth_widgets/auth_header.dart';
import '../auth_widgets/auth_text_form_filed.dart';
import '../login/login_screen.dart';
import 'widgets/already_have_account.dart';
import 'widgets/paswword_validations.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  bool isObscureText = true;
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    _passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    _passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(_passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(_passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          _passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(_passwordController.text);
        hasMinLength = AppRegex.hasMinLength(_passwordController.text);
      });
    });
  }

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
            padding: EdgeInsets.all(12.0.r),
            child: Form(
              key: _formKey,

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthHeader(
                      name: 'Create an account',
                      description:
                          'Create your account and start your journey with us',
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

                    //Signup Button
                    AuthButton(
                      isLoading: isLoading,
                      name: 'Sign Up',
                      onTap: () async {
                        if (!_formKey.currentState!.validate()) return;
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          await _authService.signup(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );
                          if (!mounted) return;

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => Login()),
                          );
                        } on FirebaseAuthException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colorss.primreColor,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              content: Text(
                                e.message ?? 'Sign Up failed',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
                    Gap(20.h),
                    PasswordValidations(
                      hasLowerCase: hasLowercase,
                      hasUpperCase: hasUppercase,
                      hasSpecialCharacters: hasSpecialCharacters,
                      hasNumber: hasNumber,
                      hasMinLength: hasMinLength,
                    ),
                    Gap(10),

                    AlreadyHaveAccount(),
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
