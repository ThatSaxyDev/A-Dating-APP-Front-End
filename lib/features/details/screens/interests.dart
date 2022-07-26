import 'package:dateen/common/bottom_nav_bar.dart';
import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/details/screens/gender_selection.dart';
import 'package:dateen/features/details/screens/search_contact_list.dart';
import 'package:dateen/features/details/widgets/interest_model.dart';
import 'package:dateen/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterestsScreen extends StatefulWidget {
  static const String routeName = '/interests-screen';
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  bool selectInterest = false;

  void setInterest(bool selectedInterest) {
    selectInterest = selectedInterest;
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
                  text: 'Your interests',
                  size: Dimensions.font10 * 3.4,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            SkModernistText(
              text:
                  'Select a few of your interests and let everyone know what you\'re passionate about.',
              size: Dimensions.font14,
              maxLines: 3,
            ),

            //! select interests
            SizedBox(
              height: Dimensions.height100 * 4.6,
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childAspectRatio: 30 / 9,
                ),
                children: [
                  //! photography
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectInterest == true;
                      });
                      setInterest(true);
                    },
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        color: selectInterest == true
                            ? GlobalVariables.mainColor
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            interestsList[0].icon,
                            color: selectInterest == true
                                ? Colors.white
                                : GlobalVariables.mainColor,
                          ),
                          SizedBox(
                            width: Dimensions.width45 / 10,
                          ),
                          SkModernistText(
                            text: interestsList[0].interest,
                            size: Dimensions.font14,
                            color: selectInterest == true
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! shopping
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectInterest == true;
                      });
                      setInterest(true);
                    },
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        color: selectInterest == true
                            ? GlobalVariables.mainColor
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            interestsList[1].icon,
                            color: selectInterest == true
                                ? Colors.white
                                : GlobalVariables.mainColor,
                          ),
                          SizedBox(
                            width: Dimensions.width45 / 10,
                          ),
                          SkModernistText(
                            text: interestsList[1].interest,
                            size: Dimensions.font14,
                            color: selectInterest == true
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //!karaoke
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectInterest == true;
                      });
                      setInterest(true);
                    },
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        color: selectInterest == true
                            ? GlobalVariables.mainColor
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            interestsList[2].icon,
                            color: selectInterest == true
                                ? Colors.white
                                : GlobalVariables.mainColor,
                          ),
                          SizedBox(
                            width: Dimensions.width45 / 10,
                          ),
                          SkModernistText(
                            text: interestsList[2].interest,
                            size: Dimensions.font14,
                            color: selectInterest == true
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! yoga
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectInterest == true;
                      });
                      setInterest(true);
                    },
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        color: selectInterest == true
                            ? GlobalVariables.mainColor
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            interestsList[3].icon,
                            color: selectInterest == true
                                ? Colors.white
                                : GlobalVariables.mainColor,
                          ),
                          SizedBox(
                            width: Dimensions.width45 / 10,
                          ),
                          SkModernistText(
                            text: interestsList[3].interest,
                            size: Dimensions.font14,
                            color: selectInterest == true
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! cooking
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectInterest == true;
                      });
                      setInterest(true);
                    },
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        color: selectInterest == true
                            ? GlobalVariables.mainColor
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            interestsList[4].icon,
                            color: selectInterest == true
                                ? Colors.white
                                : GlobalVariables.mainColor,
                          ),
                          SizedBox(
                            width: Dimensions.width45 / 10,
                          ),
                          SkModernistText(
                            text: interestsList[4].interest,
                            size: Dimensions.font14,
                            color: selectInterest == true
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! tennis
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectInterest == true;
                      });
                      setInterest(true);
                    },
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        color: selectInterest == true
                            ? GlobalVariables.mainColor
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            interestsList[5].icon,
                            color: selectInterest == true
                                ? Colors.white
                                : GlobalVariables.mainColor,
                          ),
                          SizedBox(
                            width: Dimensions.width45 / 10,
                          ),
                          SkModernistText(
                            text: interestsList[5].interest,
                            size: Dimensions.font14,
                            color: selectInterest == true
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! running
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectInterest == true;
                      });
                      setInterest(true);
                    },
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        color: selectInterest == true
                            ? GlobalVariables.mainColor
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            interestsList[6].icon,
                            color: selectInterest == true
                                ? Colors.white
                                : GlobalVariables.mainColor,
                          ),
                          SizedBox(
                            width: Dimensions.width45 / 10,
                          ),
                          SkModernistText(
                            text: interestsList[6].interest,
                            size: Dimensions.font14,
                            color: selectInterest == true
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),

                  //! swimming
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectInterest == true;
                      });
                      setInterest(true);
                    },
                    child: Container(
                      height: Dimensions.height20,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        color: selectInterest == true
                            ? GlobalVariables.mainColor
                            : Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            interestsList[7].icon,
                            color: selectInterest == true
                                ? Colors.white
                                : GlobalVariables.mainColor,
                          ),
                          SizedBox(
                            width: Dimensions.width45 / 10,
                          ),
                          SkModernistText(
                            text: interestsList[7].interest,
                            size: Dimensions.font14,
                            color: selectInterest == true
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                Get.to(
                  () => const SearchContactListScreen(),
                );
              },
              child: Container(
                height: Dimensions.height110 / 2,
                width: double.infinity,
                // margin: EdgeInsets.only(
                //   top: Dimensions.height100 * 3,
                // ),
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
