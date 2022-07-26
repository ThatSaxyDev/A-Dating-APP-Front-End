import 'package:dateen/common/bottom_nav_bar.dart';
import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/details/screens/enable_notification.dart';
import 'package:dateen/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchContactListScreen extends StatelessWidget {
  static const String routeName = '/searchCL-screen';
  const SearchContactListScreen({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
            Container(
              margin: EdgeInsets.only(
                top: Dimensions.height100,
                bottom: Dimensions.height45,
              ),
              child: Image.asset('assets/images/people.png'),
            ),
            SkModernistText(
              text: 'Search for friends',
              fontWeight: FontWeight.w700,
              size: Dimensions.font24,
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            SkModernistText(
              text:
                  'You can find friends from your contact list to connect with.',
              fontWeight: FontWeight.w500,
              size: Dimensions.font14,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                 Get.to(
                      () => const EnableNotifScreen(),
                    );
              },
              child: Container(
                height: Dimensions.height110 / 2,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: Dimensions.height100 * 1.8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: GlobalVariables.mainColor,
                ),
                child: Center(
                  child: SkModernistText(
                    text: 'Access to contact list',
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
