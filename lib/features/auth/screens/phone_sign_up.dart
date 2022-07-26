import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/auth/screens/phone_verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneSignUpScreen extends StatefulWidget {
  static const String routeName = '/phonesignup-screen';
  const PhoneSignUpScreen({Key? key}) : super(key: key);

  @override
  State<PhoneSignUpScreen> createState() => _PhoneSignUpScreenState();
}

class _PhoneSignUpScreenState extends State<PhoneSignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.height100 * 1.5,
            ),
            SkModernistText(
              text: 'My mobile',
              fontWeight: FontWeight.w700,
              size: Dimensions.font10 * 3.4,
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            SkModernistText(
              text:
                  'Please enter your valid phone number. We will send you a 4-digit code to verify your account.',
              maxLines: 3,
              size: Dimensions.font14,
            ),
            Container(
              height: Dimensions.height110 / 2,
              width: double.infinity,
              margin: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height42,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius15),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: Dimensions.width20),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  maxLength: 10,
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controller,
                  formatInput: false,
                  hintText: '8012345678',
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const PhoneVerificationScreen(),
                );
              },
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
