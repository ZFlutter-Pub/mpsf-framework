// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/services.dart';
import 'mpsf_log_utils.dart';

class MpsfLoadData {
  /// 加载本地Json数据
  static Future<MpsfResultData> loadJson(String jsonPath) async {
    MpsfResultData res;
    try {
      String responseString = await rootBundle.loadString(jsonPath);
      var data = json.decode(responseString);
      if (data == null) {
        res = MpsfResultData(null, false, 0);
      } else {
        res = MpsfResultData(data, true, 200);
      }
    } catch (e) {
      mpsfLogger.e("$e");
      res = MpsfResultData(null, false, 0);
    }
    return res;
  }
}

class MpsfResultData {
  dynamic data;
  bool result;
  int code;
  MpsfResultData(this.data, this.result, this.code);
}
