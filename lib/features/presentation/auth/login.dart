import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:product_list/core/widget/customtoast.dart';
import 'package:product_list/features/presentation/auth/bloc/authlogin_bloc.dart';
import 'package:product_list/features/presentation/auth/signup.dart';
import 'package:product_list/features/presentation/auth/widget/customtext.dart';

import '../../../core/constant/colors.dart';
import '../../../core/widget/custombutton.dart';
import '../../../core/widget/customtextfield.dart';
import '../home/bottom_navi.dart';

class LoginScreen extends StatelessWidget {
  final LoginBloc bloc = LoginBloc();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userid = TextEditingController();

  LoginScreen({super.key});

  void _validateAndSubmit(BuildContext context) {
    final isFormValid = _formKey.currentState?.validate() ?? false;
    bloc.validateAndSubmit(isFormValid, context, userid.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colour.pBackgroundBlack,
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back! 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your userid';
                    }
                    return null;
                  },
                  controller: userid,
                  label: 'Phone Number',
                  hintText: 'phone number',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    StreamBuilder<bool>(
                      stream: bloc.isLoading,
                      builder: (context, snapshot) {
                        final isLoading = snapshot.data ?? false;
                        return TextButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (userid.text.isEmpty) {
                                    CustomToast(message: "Enter Your Id")
                                        .show(context);
                                  } else {
                                    CustomToast(
                                            message:
                                                "OTP sent to your phone number")
                                        .show(context);
                                    bloc.sendOtp();
                                  }
                                },
                          child: Text(
                            isLoading ? "Sending OTP..." : "Send OTP",
                            style: TextStyle(
                              color: Colour.pWhite,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                StreamBuilder<bool>(
                  stream: bloc.isOtpSent,
                  builder: (context, snapshot) {
                    final isOtpSent = snapshot.data ?? false;
                    return isOtpSent
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTexts(
                                text: "Enter OTP",
                                color: Colour.pWhite,
                                size: 16,
                                fontweight: FontWeight.bold,
                              ),
                              const SizedBox(height: 12),
                              Center(
                                child: Pinput(
                                  onCompleted: (value) {
                                    print(value);
                                  },
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  length: 4,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox();
                  },
                ),
                const SizedBox(height: 32),
                CustomButton(
                  onpress: () {
                    _validateAndSubmit(context);
                  },
                  btname: "Login",
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTexts(
                      text: "I have not an account",
                      color: Colour.pWhite,
                      size: 14,
                      fontweight: FontWeight.bold,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colour.pWhite,
                          decoration: TextDecoration.underline,
                          decorationColor: Colour.pWhite,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
