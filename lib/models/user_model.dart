import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;
  final String profileImg;
  final int point;
  final String rank;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImg,
    required this.point,
    required this.rank,
  });

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;
    return User(
      id: userDoc.id,
      name: userData!['name'],
      email: userData['email'],
      profileImg: userData['profileImg'],
      point: userData['point'],
      rank: userData['rank'],
    );
  }

  factory User.initialUser() {
    return User(
      id: '',
      name: '',
      email: '',
      profileImg: '',
      point: -1,
      rank: '',
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      profileImg,
      point,
      rank,
    ];
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, profileImg: $profileImg, point: $point, rank: $rank)';
  }
}
