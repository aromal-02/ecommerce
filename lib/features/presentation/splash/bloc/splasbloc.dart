import 'dart:async';

class SplashScreenBloc {
  final StreamController<void> _navigateController = StreamController<void>();

  Stream<void> get navigate => _navigateController.stream;

  SplashScreenBloc() {
    _startSplashTimer();
  }
  void _startSplashTimer() {
    
    Future.delayed(const Duration(seconds: 3), () {
      _navigateController.add(null); 
    });
  }
  void dispose() {
    _navigateController.close();
  }
}
