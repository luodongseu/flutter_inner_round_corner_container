
import 'dart:ui';

import 'package:flutter/material.dart';

/// 内部圆角裁剪工具
///
/// @author luodong
class InnerRoundCornerCliper extends CustomClipper<Path> {
  /// 左上角圆角大小
  final double topLeftRadius;

  /// 右上角圆角大小
  final double topRightRadius;

  /// 左下角圆角大小
  final double bottomLeftRadius;

  /// 右下角圆角大小
  final double bottomRightRadius;

  InnerRoundCornerCliper(
      {this.topLeftRadius = 0.0,
      this.topRightRadius = 0.0,
      this.bottomLeftRadius = 0.0,
      this.bottomRightRadius = 0.0});

  @override
  Path getClip(Size size) {
    Path path = new Path();
    double width = size.width;
    double height = size.height;

    /// 左上角
    path.moveTo(0, 0);
    if (topLeftRadius > 0) {
      path.moveTo(topLeftRadius, 0);
      path.arcToPoint(Offset(0, topLeftRadius),
          radius: Radius.circular(topLeftRadius));
    }

    /// 左下角
    path.lineTo(0.0, height / 2 - bottomLeftRadius);
    if (bottomLeftRadius > 0) {
      path.arcToPoint(Offset(bottomLeftRadius, height / 2),
          radius: Radius.circular(bottomLeftRadius));
    }

    /// 右下角
    path.lineTo(width - bottomRightRadius, height / 2);
    if (bottomRightRadius > 0) {
      path.arcToPoint(Offset(width, height / 2 - bottomRightRadius),
          radius: Radius.circular(bottomRightRadius));
    }

    /// 右上角
    path.lineTo(width, 0 + topRightRadius);
    if (topRightRadius > 0) {
      path.arcToPoint(Offset(width - topRightRadius, 0),
          radius: Radius.circular(topRightRadius));
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}