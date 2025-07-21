import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Svg icon
class SvgIcon extends StatelessWidget {
  /// Svg icon
  const SvgIcon({
    required this.iconPath,
    this.package,
    this.color,
    super.key,
  });

  /// The path for the icon asset.
  final String iconPath;

  /// package the icon asset will be loaded from.
  final String? package;

  /// The color of the icon.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorFilter = color != null
        ? ColorFilter.mode(
            color!,
            BlendMode.srcIn,
          )
        : null;

    return SvgPicture.asset(
      iconPath,
      package: package,
      colorFilter: colorFilter,
    );
  }
}
