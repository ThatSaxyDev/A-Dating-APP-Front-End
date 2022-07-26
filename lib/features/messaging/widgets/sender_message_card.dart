import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';

class SenderMessageCard extends StatelessWidget {
  final String text;
  final String time;
  const SenderMessageCard({
    Key? key,
    required this.text,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.height10 / 2,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Dimensions.width100 * 2.7,
          ),
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            color: GlobalVariables.lightMainColor,
            // margin: const EdgeInsets.symmetric(
            //   horizontal: 15,
            //   vertical: 5,
            // ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 20,
                top: 20,
                bottom: 20,
              ),
              child: ReadMoreText(
                text,
                style: TextStyle(
                  fontFamily: 'Sk-Modernist',
                  fontSize: Dimensions.font14,
                ),
                trimLines: 4,
                colorClickableText: GlobalVariables.mainColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: '  show less',
                moreStyle: TextStyle(
                  fontFamily: 'Sk-Modernist',
                  fontSize: Dimensions.font10 * 1.3,
                  fontWeight: FontWeight.w700,
                  color: GlobalVariables.mainColor,
                ),
                lessStyle: TextStyle(
                  fontFamily: 'Sk-Modernist',
                  fontSize: Dimensions.font10 * 1.3,
                  fontWeight: FontWeight.w700,
                  color: GlobalVariables.mainColor,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            SkModernistText(
              text: time,
              size: Dimensions.font10 * 1.2,
              color: Colors.grey..withOpacity(0.6),
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height10 / 2,
        ),
      ],
    );
  }
}
