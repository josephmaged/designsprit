import 'dart:convert';
import 'dart:io';

import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/profile/data/models/user_data_model.dart';
import 'package:designsprit/features/profile/domain/entities/user_data.dart';
import 'package:designsprit/features/profile/domain/use_cases/update_profile_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit(this.updateProfileUseCase) : super(const ProfileState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController sourceController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  String? image;

  String fuid = CacheHelper.getData(key: Constants.fID);

  MultipartFile? imageFile;
  File? imageUi;

  Future<void> setUserData() async {
    String userString = CacheHelper.getData(key: Constants.userData);
    Map<String, dynamic> userMap = jsonDecode(userString);
    usernameController.text = userMap['name'] ?? userMap['userName'] ?? '';
    emailController.text = userMap['email'] ?? userMap['userEmail'] ?? '';
    phoneController.text = userMap['phone'] ?? '';
    mobileController.text = userMap['mobile'] ?? "";
    image = userMap['image'] ?? userMap['Image'] ?? '';

    print(fuid);

    emit(state.copyWith(
      name: usernameController.text,
      email: emailController.text,
      phone: phoneController.text,
      mobile: mobileController.text,
      image: image,
    ));
  }

  Future<void> updateProfile() async {
    final result = await updateProfileUseCase(UserData(
      fuid: fuid,
      userName: usernameController.text,
      phone: phoneController.text,
      mobile: mobileController.text,
      source: sourceController.text,
      userEmail: emailController.text,
      imageFile: imageFile,
    ));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        requestResponse: r,
        requestState: RequestState.loaded,
      ));
      print(r[0]);

      Fluttertoast.showToast(
        msg: 'Profile Edit Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 14.sp,
      );

      UserData userData = r[0];
      CacheHelper.saveData(key: Constants.fID, value: r[0].fuid);
      CacheHelper.saveData(key: Constants.userID, value: r[0].id);
      String user = jsonEncode(userData.toJson());
      CacheHelper.saveData(key: Constants.userData, value: user);
    });
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = await MultipartFile.fromFile(pickedFile.path);
      if (file.isFinalized) {
        Fluttertoast.showToast(
          msg: 'You don\'t change any thing',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 14.sp,
        );
      } else {
        imageFile = file;
        imageUi = File(pickedFile.path);
      }
    }
    emit(state.copyWith(
      imageUi: imageUi,
    ));
  }

/*  Future<void> saveFilePermanently(File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap(({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    }));

    imageFile = formData;

   */ /* final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);*/ /*
  }*/
}
