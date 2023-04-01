import 'dart:convert';
import 'dart:io';

import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/profile/domain/entities/user_data.dart';
import 'package:designsprit/features/profile/domain/use_cases/update_profile_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

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

  String image = '';

  String fuid = CacheHelper.getData(key: Constants.fID);

  File? imageFile;

  Future<void> setUserData() async {
    String userString = CacheHelper.getData(key: Constants.userData);
    Map<String, dynamic> userMap = jsonDecode(userString);
    usernameController.text = userMap['name'];
    emailController.text = userMap['email'];
    phoneController.text = userMap['phone'];
    mobileController.text = userMap['mobile'];
    image = userMap['image'];

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
      imageFile: imageFile!,
    ));

    result.fold((l) {
      emit(state.copyWith(
        requestState: RequestState.error,
        responseMessage: l.errMessage,
      ));
    }, (r) {
      emit(state.copyWith(
        requsetResponse: r,
        requestState: RequestState.loaded,
      ));

      CacheHelper.saveData(key: Constants.fID, value: r[0].fuid);
      CacheHelper.saveData(key: Constants.userID, value: r[0].id);
      String user = jsonEncode(r[0]);
      CacheHelper.saveData(key: Constants.userData, value: user);
    });
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }
}
