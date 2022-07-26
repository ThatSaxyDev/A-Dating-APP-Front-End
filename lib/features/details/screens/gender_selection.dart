import 'package:dateen/common/bottom_nav_bar.dart';
import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/details/screens/interests.dart';
import 'package:dateen/features/details/screens/profile_details.dart';
import 'package:dateen/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderSelectionScreen extends StatefulWidget {
  static const String routeName = '/genderselection-screen';
  const GenderSelectionScreen({Key? key}) : super(key: key);

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  int selectGender = 0;

  void setGender(int selectedGender) {
    selectGender = selectedGender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width42),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: Dimensions.height50,
                    width: Dimensions.width50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: GlobalVariables.mainColor,
                        size: Dimensions.iconSize16,
                      ),
                    ),
                  ),
                ),
//
                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const BottomNavBar(),
                    );
                  },
                  child: SkModernistText(
                    text: 'Skip',
                    color: GlobalVariables.mainColor,
                    size: Dimensions.font16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height50,
            ),
            Row(
              children: [
                SkModernistText(
                  text: 'I am a',
                  size: Dimensions.font10 * 3.4,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),

            //! select gender - woman
            GestureDetector(
              onTap: () {
                setState(() {
                  selectGender == 1;
                });
                setGender(1);
              },
              child: Container(
                height: Dimensions.height110 / 2,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: Dimensions.height80,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  color: selectGender == 1
                      ? GlobalVariables.mainColor
                      : Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkModernistText(
                        text: 'Woman',
                        size: Dimensions.font16,
                        color: selectGender == 1 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.check,
                        size: Dimensions.iconSize20,
                        color: selectGender == 1
                            ? Colors.white
                            : Colors.grey.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //! man
            GestureDetector(
              onTap: () {
                setState(() {
                  selectGender == 2;
                });
                setGender(2);
              },
              child: Container(
                height: Dimensions.height110 / 2,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  color: selectGender == 2
                      ? GlobalVariables.mainColor
                      : Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkModernistText(
                        text: 'Man',
                        size: Dimensions.font16,
                        color: selectGender == 2 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.check,
                        size: Dimensions.iconSize20,
                        color: selectGender == 2
                            ? Colors.white
                            : Colors.grey.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.to(
                  () => const InterestsScreen(),
                );
              },
              child: Container(
                height: Dimensions.height110 / 2,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: Dimensions.height100 * 3,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: GlobalVariables.mainColor,
                ),
                child: Center(
                  child: SkModernistText(
                    text: 'Continue',
                    size: Dimensions.font16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
