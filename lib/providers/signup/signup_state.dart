import 'package:equatable/equatable.dart';
import 'package:fb_auth_provider/models/custom_error.dart';

enum SignUpStatus {
  inital,
  submitting,
  success,
  error,
}

class SignUpState extends Equatable {
  final SignUpStatus signUpStatus;
  final CustomError error;
  SignUpState({
    required this.signUpStatus,
    required this.error,
  });

  factory SignUpState.inital() {
    return SignUpState(
      signUpStatus: SignUpStatus.inital,
      error: CustomError(),
    );
  }

  @override
  List<Object> get props => [SignUpStatus, error];

  @override
  String toString() =>
      'SignUpState(SignUpStatus: $SignUpStatus, error: $error)';

  SignUpState copyWith({
    SignUpStatus? signUpStatus,
    CustomError? error,
  }) {
    return SignUpState(
      signUpStatus: signUpStatus ?? this.signUpStatus,
      error: error ?? this.error,
    );
  }
}
