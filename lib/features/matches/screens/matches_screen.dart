import 'dart:ui';

import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:flutter/material.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({Key? key}) : super(key: key);

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.height42,
        ),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SkModernistText(
                  text: 'Matches',
                  fontWeight: FontWeight.w700,
                  size: Dimensions.font10 * 3.4,
                ),
                Container(
                  height: Dimensions.height50,
                  width: Dimensions.width50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.6),
                    ),
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.shuffle,
                      color: GlobalVariables.mainColor,
                      size: Dimensions.iconSize10 * 2.6,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            SkModernistText(
              text:
                  'This is a list of people who have liked you and your matches.',
              size: Dimensions.font14,
              maxLines: 3,
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: Dimensions.height20,
                top: Dimensions.height30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                  SkModernistText(
                    text: '  Today  ',
                    size: Dimensions.font24 / 2,
                  ),
                  Expanded(
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: GridView.builder(
                itemCount: GlobalVariables.matchCardItems.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: Dimensions.height15,
                  crossAxisSpacing: Dimensions.height15,
                  childAspectRatio: 9 / 14,
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              GlobalVariables.matchCardItems[index]['image'],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0, 0.43),
                        child: SkModernistText(
                          text: GlobalVariables.matchCardItems[index]['name'],
                          color: Colors.white,
                          size: Dimensions.font16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(Dimensions.radius7 * 2),
                            bottomRight:
                                Radius.circular(Dimensions.radius7 * 2),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                            child: Container(
                              height: Dimensions.height50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(Dimensions.radius7 * 2),
                                  bottomRight:
                                      Radius.circular(Dimensions.radius7 * 2),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                  VerticalDivider(
                                    thickness: 2,
                                    color: Colors.white,
                                  ),
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              // child: Padding(
                              //   padding: EdgeInsets.only(left: Dimensions.width20),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Row(
                              //         children: [
                              //           SkModernistText(
                              //             text: name,
                              //             fontWeight: FontWeight.w700,
                              //             size: Dimensions.font24,
                              //             color: Colors.white,
                              //           ),
                              //           SkModernistText(
                              //             text: age.toString(),
                              //             fontWeight: FontWeight.w700,
                              //             size: Dimensions.font24,
                              //             color: Colors.white,
                              //           ),
                              //         ],
                              //       ),
                              //       SkModernistText(
                              //         text: job,
                              //         size: Dimensions.font14,
                              //         color: Colors.white,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
