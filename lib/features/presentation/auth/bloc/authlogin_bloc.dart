import 'dart:async';

import 'package:flutter/material.dart';
import 'package:product_list/features/data/api/login_api.dart';

import '../../../../core/widget/customtoast.dart';
import '../../home/bottom_navi.dart';

class LoginBloc {
  final _loadingController = StreamController<bool>();
  final _otpSentController = StreamController<bool>();
  final _formValidationController = StreamController<bool>();
  final LoginController _registerController = LoginController();

  Stream<bool> get isLoading => _loadingController.stream;
  Stream<bool> get isOtpSent => _otpSentController.stream;

  void sendOtp() {
    _loadingController.add(true);
    Future.delayed(const Duration(seconds: 1), () {
      _loadingController.add(false);
      _otpSentController.add(true);
    });
  }

  void validateAndSubmit(bool isFormValid, context, phone) async {
    if (isFormValid) {
      try {
        final token = await _registerController.verify({
          'phone_number': phone,
        });

        if (token.isNotEmpty) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BottomNavigation()),
          );
          CustomToast(message: "Successfully Login").show(context);
        }
      } catch (e) {
        CustomToast(message: 'Login Failed ,or User Not Fount').show(context);
      }
    }

    void dispose() {
      _loadingController.close();
      _otpSentController.close();
      _formValidationController.close();
    }
  }
}
