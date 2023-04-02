import 'dart:io';

import 'package:dio/dio.dart';
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
  final MultipartFile? imageFile;

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


  Map<String, dynamic> toJson() => {
    'id': id,
    'fuid': fuid,
    'userName': userName,
    'userEmail': userEmail,
    'phone': phone,
    'mobile': mobile,
    'knownFrom': source,
    'image': image,
  };

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
