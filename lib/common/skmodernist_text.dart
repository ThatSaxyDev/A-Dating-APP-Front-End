import 'package:dateen/constants/dimensions.dart';
import 'package:flutter/material.dart';

class SkModernistText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overFlow;
  final FontWeight? fontWeight;
  final int maxLines;
  final TextAlign? textAlign;
  const SkModernistText({
    Key? key,
    this.color = Colors.black,
    required this.text,
    this.size = 0,
    this.overFlow = TextOverflow.ellipsis,
    this.fontWeight,
    this.maxLines = 1,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontFamily: 'Sk-Modernist',
        fontSize: size == 0 ? Dimensions.font20 : size,
      ),
    );
  }
}
