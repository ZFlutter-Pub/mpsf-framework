import 'mpsf_text_util.dart';

///字符串
String mpsfStr(String? data, {String placehold = ""}) {
  if (MpsfTextUtil.isEmpty(data)) {
    return placehold;
  }
  return data!;
}
