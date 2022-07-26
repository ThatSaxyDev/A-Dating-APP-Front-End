import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/auth/screens/phone_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width42),
        child: ListView(
          children: [
            SizedBox(
              height: Dimensions.height100,
            ),
            //! logo
            Container(
              height: Dimensions.height100,
              width: Dimensions.height100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'))),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: Dimensions.height80),
              child: SkModernistText(
                text: 'Sign up to continue',
                size: Dimensions.font19,
                fontWeight: FontWeight.w700,
              ),
            ),

            //! continue with email
            GestureDetector(
              onTap: () {},
              child: Container(
                height: Dimensions.height110 / 2,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: Dimensions.height30,
                  bottom: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: GlobalVariables.mainColor,
                ),
                child: Center(
                  child: SkModernistText(
                    text: 'Continue with email',
                    size: Dimensions.font16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            //! use phone number
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const PhoneSignUpScreen(),
                );
              },
              child: Container(
                height: Dimensions.height110 / 2,
                width: double.infinity,
                margin: EdgeInsets.only(
                  bottom: Dimensions.height80,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),
                child: Center(
                  child: SkModernistText(
                    text: 'Use phone number',
                    size: Dimensions.font16,
                    color: GlobalVariables.mainColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Dimensions.height30),
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
                    text: '  or sign up with  ',
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
            Padding(
              padding: EdgeInsets.only(bottom: Dimensions.height80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: Dimensions.height10 * 6.4,
                    width: Dimensions.width10 * 6.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.radius7),
                    ),
                    child: Center(
                        child: Image.asset('assets/icons/facebookicon.png')),
                  ),
                  SizedBox(
                    width: Dimensions.width20,
                  ),
                  Container(
                    height: Dimensions.height10 * 6.4,
                    width: Dimensions.width10 * 6.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.radius7),
                    ),
                    child: Center(
                        child: Image.asset('assets/icons/googleicon.png')),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SkModernistText(
                  text: 'Terms of use',
                  size: Dimensions.font14,
                  color: GlobalVariables.mainColor,
                ),
                SizedBox(
                  width: Dimensions.width30,
                ),
                SkModernistText(
                  text: 'Privacy Policy',
                  size: Dimensions.font14,
                  color: GlobalVariables.mainColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
