import 'package:flustars_flutter3/flustars_flutter3.dart';

///字符串
String mpsfStr(String? data, {String placehold = ""}) {
  if (TextUtil.isEmpty(data)) {
    return placehold;
  }
  return data!;
}
