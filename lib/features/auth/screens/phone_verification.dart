import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/auth/screens/phone_sign_up.dart';
import 'package:dateen/features/auth/widgets/number_pad.dart';
import 'package:dateen/features/auth/widgets/resend_otp_timer.dart';
import 'package:dateen/features/details/screens/profile_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class PhoneVerificationScreen extends StatefulWidget {
  static const String routeName = '/phoneverification_screen';
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final TextEditingController _controller = TextEditingController();

  FocusNode pin2FocusNode = FocusNode();
  FocusNode pin3FocusNode = FocusNode();
  FocusNode pin4FocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
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
                        () => const ProfileDetailsScreen(),
                      );
                    },
                    child: Container(
                      height: Dimensions.height50,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: GlobalVariables.mainColor,
                          size: Dimensions.iconSize16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.height50,
              ),
              //! timer
              ResendOTPTimer(),
              SizedBox(
                height: Dimensions.height30,
              ),
              SkModernistText(
                text: 'Type the verification code we\'ve sent you',
                size: Dimensions.font10 * 1.8,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Dimensions.height50,
              ),

              //! otp text field
              // OTPTextField(
              //   otpFieldStyle: OtpFieldStyle(
              //     enabledBorderColor: Colors.grey,
              //     focusBorderColor: GlobalVariables.mainColor,
              //   ),
              //   length: 4,
              //   width: Dimensions.width100 * 3.4,
              //   fieldWidth: Dimensions.width10 * 7,
              //   style: TextStyle(fontSize: 17),
              //   textFieldAlignment: MainAxisAlignment.spaceBetween,
              //   fieldStyle: FieldStyle.box,
              //   onCompleted: (pin) {
              //     print("Completed: " + pin);
              //   },
              // ),

              //! otp text field alt
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Dimensions.height10 * 7,
                      width: Dimensions.width10 * 6.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: GlobalVariables.mainColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: TextFormField(
                        autofocus: true,
                        cursorColor: GlobalVariables.mainColor,
                        onSaved: (pin1) {},
                        onChanged: (value) {
                          nextField(
                            value: value,
                            focusNode: pin2FocusNode,
                          );
                        },
                        style: Theme.of(context).textTheme.headlineLarge,
                        decoration: InputDecoration(border: InputBorder.none),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      height: Dimensions.height10 * 7,
                      width: Dimensions.width10 * 6.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: GlobalVariables.mainColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: TextFormField(
                        focusNode: pin2FocusNode,
                        cursorColor: GlobalVariables.mainColor,
                        onSaved: (pin2) {},
                        onChanged: (value) {
                          nextField(
                            value: value,
                            focusNode: pin3FocusNode,
                          );
                        },
                        style: Theme.of(context).textTheme.headlineLarge,
                        decoration: InputDecoration(border: InputBorder.none),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      height: Dimensions.height10 * 7,
                      width: Dimensions.width10 * 6.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: GlobalVariables.mainColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: TextFormField(
                        focusNode: pin3FocusNode,
                        cursorColor: GlobalVariables.mainColor,
                        onSaved: (pin3) {},
                        onChanged: (value) {
                          nextField(
                            value: value,
                            focusNode: pin4FocusNode,
                          );
                        },
                        style: Theme.of(context).textTheme.headlineLarge,
                        decoration: InputDecoration(border: InputBorder.none),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    Container(
                      height: Dimensions.height10 * 7,
                      width: Dimensions.width10 * 6.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: GlobalVariables.mainColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: TextFormField(
                        focusNode: pin4FocusNode,
                        cursorColor: GlobalVariables.mainColor,
                        onSaved: (pin4) {},
                        onChanged: (value) {
                          // if (value.length == 1 ||
                          //     value.length == value.length - 1) {
                          //   FocusScope.of(context).nextFocus();
                          // }
                          pin4FocusNode.unfocus();
                        },
                        style: Theme.of(context).textTheme.headlineLarge,
                        decoration: InputDecoration(border: InputBorder.none),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //! num pad
              // NumPad(
              //   delete: () {
              //     pin1.text =
              //         pin1.text.substring(0, pin1.text.length - 1);
              //   },
              //   onSubmit: () {},
              //   controller: pin1,
              // ),

              //! send otp again
              Container(
                margin: EdgeInsets.only(top: Dimensions.height100),
                child: SkModernistText(
                  text: 'Send again',
                  fontWeight: FontWeight.w700,
                  size: Dimensions.font16,
                  color: GlobalVariables.mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
