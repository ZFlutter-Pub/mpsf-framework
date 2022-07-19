import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import '../utils/mpsf_image_utils.dart';

/// 图片加载（支持本地与网络图片）
class MpsfNetworkImage extends StatelessWidget {
  const MpsfNetworkImage(
    this.image, {
    Key? key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  final String? image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    if (!TextUtil.isEmpty(image)) {
      if (image!.startsWith("http")) {
        return CachedNetworkImage(
            imageUrl: image!,
            placeholder: (context, url) {
              return placeholder ?? Container(color: Colors.grey);
            },
            errorWidget: (context, url, error) {
              return errorWidget ?? Container(color: Colors.grey);
            },
            width: width,
            height: height,
            fit: fit,
            color: color);
      } else {
        return MpsfAssetImage(image!,
            height: height, width: width, fit: fit, format: "png");
      }
    } else {
      return Container();
    }
  }
}

/// 加载本地资源图片
class MpsfAssetImage extends StatelessWidget {
  const MpsfAssetImage(
    this.image, {
    Key? key,
    this.width,
    this.height,
    this.scale,
    this.fit,
    this.format = 'png',
    this.color,
  }) : super(key: key);

  final String image;
  final String format;
  final double? width;
  final double? height;
  final double? scale;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MpsfImageUtils.getImgPath(image, format: format),
      height: height,
      width: width,
      scale: scale,
      fit: fit,
      color: color,
    );
  }
}
