import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

class MpsfImageUtils {
  static ImageProvider getAssetImage(String namePath, {String format = 'png'}) {
    return AssetImage(getImgPath(namePath, format: format));
  }

  static String getImgPath(String namePath, {String format = 'png'}) {
    return 'assets/$namePath.$format';
  }

  static ImageProvider getImageProvider(String imageUrl,
      {String holderImg = "images/placeholder"}) {
    if (TextUtil.isEmpty(imageUrl)) {
      return AssetImage(getImgPath(holderImg));
    }
    return CachedNetworkImageProvider(imageUrl);
  }
}
