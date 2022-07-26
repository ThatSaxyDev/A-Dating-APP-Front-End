import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/home/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:swipable_stack/swipable_stack.dart';

class BottomButtonsRow extends StatelessWidget {
  const BottomButtonsRow({
    required this.onRewindTap,
    required this.onSwipe,
    required this.canRewind,
    super.key,
  });

  final bool canRewind;
  final VoidCallback onRewindTap;
  final ValueChanged<SwipeDirection> onSwipe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          height: Dimensions.height100 * 7.41,
          child: Stack(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: Dimensions.width10 * 3.4,
                  ),
                  // _BottomButton(
                  //   color: canRewind ? Colors.amberAccent : Colors.grey,
                  //   onPressed: canRewind ? onRewindTap : null,
                  //   child: const Icon(Icons.refresh),
                  // ),
                  GestureDetector(
                    onTap: canRewind ? onRewindTap : null,
                    child: Container(
                      height: Dimensions.height50,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        color: canRewind
                            ? GlobalVariables.mainColor
                            : Colors.transparent,
                        border: Border.all(
                          color: canRewind
                              ? Colors.transparent
                              : Colors.grey.withOpacity(0.6),
                        ),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.refresh,
                          color: canRewind
                              ? Colors.white
                              : GlobalVariables.mainColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: Dimensions.height10 * 2.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _BottomButton(
                        color: Colors.white,
                        onPressed: () {
                          onSwipe(SwipeDirection.left);
                        },
                        height: Dimensions.height10 * 7,
                        child: Icon(
                          Icons.close,
                          color: GlobalVariables.mainColor,
                          size: Dimensions.font10 * 3.5,
                        ),
                      ),
                      // _BottomButton(
                      //   color: SwipeDirectionColor.up,
                      //   onPressed: () {
                      //     onSwipe(SwipeDirection.up);
                      //   },
                      //   child: const Icon(Icons.arrow_upward),
                      // ),

                      _BottomButton(
                        color: GlobalVariables.mainColor,
                        onPressed: () {
                          onSwipe(SwipeDirection.down);
                        },
                        height: Dimensions.height100,
                        child: Icon(
                          Icons.favorite,
                          size: Dimensions.height10 * 5.5,
                        ),
                      ),
                      _BottomButton(
                        color: Colors.white,
                        onPressed: () {
                          onSwipe(SwipeDirection.right);
                        },
                        height: Dimensions.height10 * 7,
                        child: Icon(
                          Icons.star_rounded,
                          color: GlobalVariables.starColor,
                          size: Dimensions.font10 * 3.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton(
      {required this.onPressed,
      required this.child,
      required this.color,
      required this.height});

  final VoidCallback? onPressed;
  final Icon child;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(height),
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => color,
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
