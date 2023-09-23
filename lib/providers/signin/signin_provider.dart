import 'package:fb_auth_provider/models/custom_error.dart';
import 'package:flutter/foundation.dart';

import 'package:fb_auth_provider/providers/signin/signin_state.dart';
import 'package:fb_auth_provider/repositories/auth_repository.dart';

class SigininProvider with ChangeNotifier {
  SigninState _state = SigninState.inital();
  SigninState get state => _state;

  final AuthRepository authRepository;
  SigininProvider({
    required this.authRepository,
  });

  Future<void> signIn({required String email, required String password}) async {
    _state = _state.copyWith(signinStatus: SigninStatus.submitting);
    notifyListeners();

    try {
      await authRepository.signIn(email: email, password: password);
      _state = _state.copyWith(signinStatus: SigninStatus.success);
      notifyListeners();
    } on CustomError catch (e) {
      _state = _state.copyWith(
        signinStatus: SigninStatus.error,
        error: e,
      );
      notifyListeners();
      rethrow;
    }
  }
}
