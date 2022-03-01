import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import '../utils/mpsf_image_utils.dart';

/// 图片加载（支持本地与网络图片）
class MpsfNetworkImage extends StatelessWidget {
  const MpsfNetworkImage(this.imageUrl,
      {Key? key,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.color,
      this.holderImg = "images/placeholder"})
      : super(key: key);

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final String holderImg;

  @override
  Widget build(BuildContext context) {
    Widget placeHolder = MpsfAssetImage(holderImg,
        height: height, width: width, fit: fit, format: "png");
    if (!TextUtil.isEmpty(imageUrl) && imageUrl!.startsWith("http")) {
      return CachedNetworkImage(
          imageUrl: imageUrl!,
          placeholder: (context, url) {
            return placeHolder;
          },
          errorWidget: (context, url, error) {
            return placeHolder;
          },
          width: width,
          height: height,
          fit: fit,
          color: color);
    } else {
      return placeHolder;
    }
  }
}

/// 加载本地资源图片
class MpsfAssetImage extends StatelessWidget {
  const MpsfAssetImage(
    this.name, {
    Key? key,
    this.width,
    this.height,
    this.scale,
    this.fit,
    this.format = 'png',
    this.color,
  }) : super(key: key);

  final String name;
  final String format;
  final double? width;
  final double? height;
  final double? scale;
  final BoxFit? fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      MpsfImageUtils.getImgPath(name, format: format),
      height: height,
      width: width,
      scale: scale,
      fit: fit,
      color: color,
    );
  }
}
