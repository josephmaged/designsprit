import 'dart:io';

import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final int? id;
  final String? fuid;
  final String? userName;
  final String? userEmail;
  final String? phone;
  final String? mobile;
  final String? source;
  final String? image;
  final File? imageFile;

  const UserData(
      {this.id,
      this.fuid,
      this.userName,
      this.userEmail,
      this.phone,
      this.mobile,
      this.source,
      this.image,
      this.imageFile});

  @override
  List<Object?> get props => [
        id,
        fuid,
        userName,
        userEmail,
        phone,
        mobile,
        source,
        image,
        imageFile,
      ];
}
