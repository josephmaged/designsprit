import 'dart:io';

import 'package:designsprit/core/network/api_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DocItem extends StatelessWidget {
  String docUrl;

  DocItem({Key? key, required this.docUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: TextButton(
        onPressed: () {
          openFile(ApiConst.getChatMedia(docUrl));
        },
        child: Text(
          docUrl,
        ),
      ),
    );
  }

  Future<void> openFile(String url) async {
    final file = await downloadFile(url);
    if (file == null) return;
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      final file = File('${appStorage.path}/${url.split('/').last}');
      final options = Options(followRedirects: false, responseType: ResponseType.bytes);
      final res = await Dio().get(url, options: options);
      final ref = file.openSync(mode: FileMode.write);
      ref.writeFromSync(res.data);
      await ref.close();
      return file;
    } catch (e) {
      return null;
    }
  }
}
