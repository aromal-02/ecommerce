import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/widget/customtoast.dart';
import '../../../data/api/register_api.dart';
import '../../home/bottom_navi.dart';

class SignUpBloc {
  final _loadingController = StreamController<bool>();
  final _otpSentController = StreamController<bool>();
  final RegisterController _registerController = RegisterController();

  Stream<bool> get isLoading => _loadingController.stream;
  Stream<bool> get isOtpSent => _otpSentController.stream;

  void sendOtp() {
    _loadingController.sink.add(true);
    Future.delayed(const Duration(seconds: 1), () {
      _loadingController.sink.add(false);
      _otpSentController.sink.add(true);
    });
  }

  void login(String username, String password, BuildContext context) async {
  try {
    final token = await _registerController.register({
      'first_name': username,
      'phone_number': password,
    });

    if (token.isNotEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomNavigation()),
      );
      CustomToast(message: "Successfully Login").show(context);
    }
  } catch (e) {
    CustomToast(message: 'Login failed: $e').show(context);
  }
}


  void dispose() {
    _loadingController.close();
    _otpSentController.close();
  }
}
