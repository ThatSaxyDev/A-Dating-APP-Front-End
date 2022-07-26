import 'dart:ui';

import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/home/widgets/bottom_buttons_row.dart';
import 'package:dateen/features/home/widgets/card.dart';
import 'package:dateen/features/home/widgets/card_overlay.dart';
import 'package:dateen/features/home/widgets/filter_modal_bottom.dart';
import 'package:dateen/features/messaging/widgets/chat_modal_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:swipable_stack/swipable_stack.dart';

const _images = [
  'assets/images/girl4.png',
  'assets/images/girl1.png',
  'assets/images/girl2.png',
  'assets/images/girl3.png',
];

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final SwipableStackController _controller;

  void _listenController() => setState(() {});

  @override
  void initState() {
    super.initState();
    _controller = SwipableStackController()..addListener(_listenController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_listenController)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Dimensions.width42,
              right: Dimensions.width42,
              top: Dimensions.height50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: Dimensions.height50,
                    width: Dimensions.width50,
                    // decoration: BoxDecoration(
                    //   border: Border.all(
                    //     color: Colors.grey.withOpacity(0.6),
                    //   ),
                    //   borderRadius: BorderRadius.circular(Dimensions.radius15),
                    // ),
                    // child: Center(
                    //   child: Icon(
                    //     Icons.arrow_back_ios_new,
                    //     color: GlobalVariables.mainColor,
                    //     size: Dimensions.iconSize16,
                    //   ),
                    // ),
                  ),
                ),
                // Column(
                //   children: [
                //     SkModernistText(
                //       text: 'Discover',
                //       size: Dimensions.font24,
                //       fontWeight: FontWeight.w700,
                //     ),
                //     SkModernistText(
                //       text: 'Lagos',
                //       size: Dimensions.font24 / 2,
                //       fontWeight: FontWeight.w400,
                //     ),
                //   ],
                // ),
                SkModernistText(
                  text: 'Discover',
                  size: Dimensions.font24,
                  fontWeight: FontWeight.w700,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(Dimensions.radius15 * 2),
                        ),
                      ),
                      context: context,
                      builder: (context) => const FilterModalBottom(),
                    );
                  },
                  child: Container(
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
                        Icons.menu,
                        color: GlobalVariables.mainColor,
                        size: Dimensions.iconSize10 * 2.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //! location text, column was not working
          Positioned(
            left: Dimensions.width100 * 1.76,
            top: Dimensions.height45 * 2,
            child: SkModernistText(
              text: 'Lagos',
              size: Dimensions.font24 / 2,
              fontWeight: FontWeight.w400,
            ),
          ),

          Align(
            alignment: const Alignment(0, -0.6),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.radius15),
                  bottomRight: Radius.circular(Dimensions.radius15),
                ),
                clipBehavior: Clip.antiAlias,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    width: Dimensions.width100 * 2.9,
                    height: Dimensions.height100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          GlobalVariables.lightMainColor,
                          Colors.white,
                          GlobalVariables.lightMainColor,
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      //  color: Colors.blue.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width42,
                  vertical: Dimensions.height100 * 1.5),
              child: SwipableStack(
                // itemCount: GlobalVariables.cardItems.length,
                detectableSwipeDirections: const {
                  SwipeDirection.right,
                  SwipeDirection.left,
                  SwipeDirection.down,
                },
                controller: _controller,
                stackClipBehaviour: Clip.none,
                onSwipeCompleted: (index, direction) {
                  if (kDebugMode) {
                    print('$index, $direction');
                  }
                },
                horizontalSwipeThreshold: 0.8,
                verticalSwipeThreshold: 0.8,
                builder: (context, properties) {
                  final itemIndex =
                      properties.index % GlobalVariables.cardItems.length;

                  return Stack(
                    children: [
                      CCard(
                        name:
                            '${GlobalVariables.cardItems[itemIndex]['name']}, ',
                        age: GlobalVariables.cardItems[itemIndex]['age'],
                        job: '${GlobalVariables.cardItems[itemIndex]['job']}',
                        assetPath: _images[itemIndex],
                      ),
                      // more custom overlay possible than with overlayBuilder
                      if (properties.stackIndex == 0 &&
                          properties.direction != null)
                        CardOverlay(
                          swipeProgress: properties.swipeProgress,
                          direction: properties.direction!,
                        )
                    ],
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: BottomButtonsRow(
              onSwipe: (direction) {
                _controller.next(swipeDirection: direction);
              },
              onRewindTap: _controller.rewind,
              canRewind: _controller.canRewind,
            ),
          ),
        ],
      ),
    );
  }
}
