import 'dart:async';

class LoginBloc {
  final _loadingController = StreamController<bool>();
  final _otpSentController = StreamController<bool>();
  final _formValidationController = StreamController<bool>();

  Stream<bool> get isLoading => _loadingController.stream;
  Stream<bool> get isOtpSent => _otpSentController.stream;

  void sendOtp() {
    _loadingController.add(true);
    Future.delayed(const Duration(seconds: 1), () {
      _loadingController.add(false);
      _otpSentController.add(true);
    });
  }

  void validateAndSubmit(bool isFormValid, void Function() navigateToHome) {
    if (isFormValid) {
      navigateToHome();
    }
  }

  void dispose() {
    _loadingController.close();
    _otpSentController.close();
    _formValidationController.close();
  }
}
