import 'package:fb_auth_provider/models/custom_error.dart';
import 'package:fb_auth_provider/providers/signup/signup_state.dart';
import 'package:flutter/foundation.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';

class SignUpProvider with ChangeNotifier {
  SignUpState _state = SignUpState.inital();
  SignUpState get state => _state;

  final AuthRepository authRepository;
  SignUpProvider({
    required this.authRepository,
  });

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    _state = _state.copyWith(signUpStatus: SignUpStatus.submitting);
    notifyListeners();

    try {
      await authRepository.signUp(name: name, email: email, password: password);
      _state = _state.copyWith(signUpStatus: SignUpStatus.success);
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(
        signUpStatus: SignUpStatus.error,
        error: e,
      );
      notifyListeners();
      rethrow;
    }
  }
}
