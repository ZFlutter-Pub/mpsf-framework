import 'package:package_info_plus/package_info_plus.dart';

class MpsfPackageInfo {
  /// * 获取包信息
  static Future<PackageInfo> getAppPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  /// * 获取版本号
  static Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// * 获取 buildNumber
  static Future<String> getBuildNum() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }
}
