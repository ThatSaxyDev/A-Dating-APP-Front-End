import 'dart:ui';

import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/home/widgets/bottom_buttons_row.dart';
import 'package:flutter/material.dart';

class CCard extends StatelessWidget {
  const CCard({
    required this.name,
    required this.age,
    required this.job,
    required this.assetPath,
    super.key,
  });

  final String name;
  final int age;
  final String assetPath;
  final String job;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius7 * 2),
                image: DecorationImage(
                  image: AssetImage(assetPath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    blurRadius: 26,
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.height100 * 2,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(Dimensions.radius7 * 2),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black12.withOpacity(0),
                    Colors.black12.withOpacity(.4),
                    Colors.black12.withOpacity(.82),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Dimensions.radius7 * 2),
                bottomRight: Radius.circular(Dimensions.radius7 * 2),
              ),
              clipBehavior: Clip.antiAlias,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  height: Dimensions.height10 * 9,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Dimensions.radius7 * 2),
                      bottomRight: Radius.circular(Dimensions.radius7 * 2),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: Dimensions.width20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SkModernistText(
                              text: name,
                              fontWeight: FontWeight.w700,
                              size: Dimensions.font24,
                              color: Colors.white,
                            ),
                            SkModernistText(
                              text: age.toString(),
                              fontWeight: FontWeight.w700,
                              size: Dimensions.font24,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SkModernistText(
                          text: job,
                          size: Dimensions.font14,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
