import 'package:equatable/equatable.dart';

import 'package:fb_auth_provider/models/custom_error.dart';
import 'package:fb_auth_provider/models/user_model.dart';

enum ProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProfileState extends Equatable {
  final ProfileStatus profileStatus;
  final User user;
  final CustomError customError;

  factory ProfileState.initial() {
    return ProfileState(
      user: User.initialUser(),
      customError: CustomError(),
      profileStatus: ProfileStatus.initial,
    );
  }

  ProfileState({
    required this.user,
    required this.customError,
    required this.profileStatus,
  });

  @override
  List<Object> get props => [profileStatus, user, customError];

  @override
  String toString() =>
      'ProfileState(profileStatus: $profileStatus, user: $user, customError: $customError)';

  ProfileState copyWith({
    ProfileStatus? profileStatus,
    User? user,
    CustomError? customError,
  }) {
    return ProfileState(
      profileStatus: profileStatus ?? this.profileStatus,
      user: user ?? this.user,
      customError: customError ?? this.customError,
    );
  }
}
