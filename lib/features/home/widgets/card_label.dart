import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/home/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

const _labelAngle = math.pi / 2 * 0.2;

class CardLabel extends StatelessWidget {
  const CardLabel._({
    required this.color,
    required this.icon,
    // required this.angle,
    required this.alignment,
  });

  factory CardLabel.right() {
    return CardLabel._(
      color: SwipeDirectionColor.right,
      icon: Icon(
        Icons.star_rounded,
        size: Dimensions.iconSize10 * 5,
        color: GlobalVariables.starColor,
      ),
      // angle: -_labelAngle,
      alignment: Alignment.center,
    );
  }

  factory CardLabel.left() {
    return CardLabel._(
      color: SwipeDirectionColor.left,
      icon: Icon(
        Icons.close,
        size: Dimensions.iconSize10 * 5,
        color: GlobalVariables.mainColor,
      ),
      // angle: _labelAngle,
      alignment: Alignment.center,
    );
  }

  // factory CardLabel.up() {
  //   return const CardLabel._(
  //     color: SwipeDirectionColor.up,
  //     icon: Icon(Icons.close),
  //     // angle: _labelAngle,
  //     alignment: Alignment.center,
  //   );
  // }

  factory CardLabel.down() {
    return CardLabel._(
      color: SwipeDirectionColor.down,
      icon: Icon(
        Icons.favorite,
        size: Dimensions.iconSize10 * 5,
        color: GlobalVariables.mainColor,
      ),
      // angle: -_labelAngle,
      alignment: Alignment.center,
    );
  }

  final Color color;
  final Icon icon;
  // final double angle;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(
        vertical: 36,
        horizontal: 36,
      ),
      child: Container(
        height: Dimensions.height45 * 2,
        width: Dimensions.height45 * 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.height45 * 2),
        ),
        padding: const EdgeInsets.all(6),
        child: icon,
      ),
    );
  }
}
