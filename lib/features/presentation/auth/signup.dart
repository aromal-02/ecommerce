import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:product_list/features/presentation/home/bottom_navi.dart';

import '../../../core/constant/colors.dart';
import '../../../core/widget/custombutton.dart';
import '../../../core/widget/customtextfield.dart';
import '../../../core/widget/customtoast.dart';
import 'bloc/authsignup_bloc.dart';
import 'widget/customtext.dart';

class SignUp extends StatelessWidget {
  final SignUpBloc bloc = SignUpBloc();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  SignUp({super.key});

  void _validateAndSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {

     bloc.login(usernameController.text, phoneController.text, context); 
    }
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
                  'Create Your Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 36),
                CustomTextFormField(
                  label: 'User Name',
                  hintText: 'Enter your username',
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null; // Return null for valid input
                  },
                ),
                const SizedBox(height: 18),
                CustomTextFormField(
                  controller: phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length != 10 || int.tryParse(value) == null) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                  label: 'Phone Number',
                  hintText: 'Enter phone number',
                ),
                const SizedBox(height: 12),
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
                                  if (phoneController.text.isEmpty) {
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
                  onpress: () => _validateAndSubmit(context),
                  btname: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
