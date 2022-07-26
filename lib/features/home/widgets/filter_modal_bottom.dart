import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:flutter/material.dart';

class FilterModalBottom extends StatefulWidget {
  const FilterModalBottom({Key? key}) : super(key: key);

  @override
  State<FilterModalBottom> createState() => _FilterModalBottomState();
}

class _FilterModalBottomState extends State<FilterModalBottom> {
  int selectInterest = 0;

  void setInterest(int selectedInterest) {
    selectInterest = selectedInterest;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.height100 * 6,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width10 * 3.8,
          vertical: Dimensions.height20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SkModernistText(text: '   '),
                SkModernistText(
                  text: 'Filters',
                  fontWeight: FontWeight.w700,
                  size: Dimensions.font24,
                ),
                SkModernistText(
                  text: 'Clear',
                  fontWeight: FontWeight.w700,
                  size: Dimensions.font16,
                  color: GlobalVariables.mainColor,
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Row(
              children: [
                SkModernistText(
                  text: 'Interested in',
                  fontWeight: FontWeight.w700,
                  size: Dimensions.font16,
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectInterest == 1;
                    });
                    setInterest(1);
                  },
                  child: Container(
                    height: Dimensions.height110 / 2,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius15),
                        bottomLeft: Radius.circular(Dimensions.radius15),
                      ),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      color: selectInterest == 1
                          ? GlobalVariables.mainColor
                          : Colors.white,
                    ),
                    child: Center(
                      child: SkModernistText(
                        text: 'Girls',
                        size: Dimensions.font16,
                        color:
                            selectInterest == 1 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectInterest == 2;
                    });
                    setInterest(2);
                  },
                  child: Container(
                    height: Dimensions.height110 / 2,
                    width: 100,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(Dimensions.radius15),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      color: selectInterest == 2
                          ? GlobalVariables.mainColor
                          : Colors.white,
                    ),
                    child: Center(
                      child: SkModernistText(
                        text: 'Boys',
                        size: Dimensions.font16,
                        color:
                            selectInterest == 2 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectInterest == 3;
                    });
                    setInterest(3);
                  },
                  child: Container(
                    height: Dimensions.height110 / 2,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius15),
                        bottomRight: Radius.circular(Dimensions.radius15),
                      ),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      color: selectInterest == 3
                          ? GlobalVariables.mainColor
                          : Colors.white,
                    ),
                    child: Center(
                      child: SkModernistText(
                        text: 'Both',
                        size: Dimensions.font16,
                        color:
                            selectInterest == 3 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
