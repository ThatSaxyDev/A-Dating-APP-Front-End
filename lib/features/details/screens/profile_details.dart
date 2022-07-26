import 'dart:io';

import 'package:dateen/common/bottom_nav_bar.dart';
import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/details/screens/gender_selection.dart';
import 'package:dateen/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetailsScreen extends StatefulWidget {
  static const String routeName = '/profiledetails-screen';
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  File? image;

  void takePhoto(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);

      print(image.name);
    } on PlatformException catch (e) {
      print('Failed to pick images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width42),
          child: Form(
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
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    top: Dimensions.height50,
                    bottom: Dimensions.height80,
                  ),
                  child: SkModernistText(
                    text: 'Profile details',
                    size: Dimensions.font10 * 3.4,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                //! profile photo
                SizedBox(
                  height: Dimensions.height100,
                  child: Stack(
                    children: [
                      // Container(
                      //   width: Dimensions.width100,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(Dimensions.height100),
                      //     color: Colors.black,
                      //     image: DecorationImage(
                      //       image: image != null ? AssetImage('assets/images/profileimg.png') : FileImage(image!)
                      //     ),
                      //   ),
                      // ),
                      CircleAvatar(
                        radius: Dimensions.height100,
                        backgroundImage: image == null
                            ? const AssetImage('assets/images/profileimg.png')
                            : FileImage(image!) as ImageProvider,
                      ),
                      Positioned(
                        bottom: Dimensions.height10 * 0.05,
                        right: Dimensions.height10 * 5.4,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (_) => bottomSheet(),
                            );
                          },
                          child: Container(
                            height: Dimensions.height10 * 3.4,
                            width: Dimensions.width10 * 3.4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  Dimensions.height10 * 3.4),
                            ),
                            child: Center(
                              child: Container(
                                height: Dimensions.height10 * 3,
                                width: Dimensions.width10 * 3,
                                decoration: BoxDecoration(
                                  color: GlobalVariables.mainColor,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.height10 * 3),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: Dimensions.height50,
                ),

                //! first name input
                SizedBox(
                  height: Dimensions.height110 / 2,
                  child: TextFormField(
                    cursorColor: GlobalVariables.mainColor,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: GlobalVariables.mainColor,
                        fontSize: Dimensions.font10 * 1.7,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'First name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: GlobalVariables.mainColor),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: Dimensions.height20,
                ),

                //! last name input
                SizedBox(
                  height: Dimensions.height110 / 2,
                  child: TextFormField(
                    cursorColor: GlobalVariables.mainColor,
                    decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        color: GlobalVariables.mainColor,
                        fontSize: Dimensions.font10 * 1.7,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Last name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: GlobalVariables.mainColor),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                    ),
                  ),
                ),

                // SizedBox(
                //   height: Dimensions.height20,
                // ),

                GestureDetector(
                  onTap: () {
                    //! to implement calendar to pick birth date
                  },
                  child: Container(
                    height: Dimensions.height110 / 2,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: GlobalVariables.lightMainColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: GlobalVariables.mainColor,
                        ),
                        SkModernistText(
                          text: 'Choose birthday date',
                          color: GlobalVariables.mainColor,
                          size: Dimensions.font14,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          width: Dimensions.width30,
                        ),
                      ],
                    ),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const GenderSelectionScreen(),
                    );
                  },
                  child: Container(
                    height: Dimensions.height110 / 2,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      top: Dimensions.height80,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: GlobalVariables.mainColor,
                    ),
                    child: Center(
                      child: SkModernistText(
                        text: 'Confirm',
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
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: Dimensions.height100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.height20,
        vertical: Dimensions.height20,
      ),
      child: Column(
        children: [
          SkModernistText(
            text: 'Choose profile photo',
            fontWeight: FontWeight.w700,
            size: Dimensions.font20,
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera_alt,
                  color: GlobalVariables.mainColor,
                ),
              ),
              IconButton(
                onPressed: () async {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(
                  Icons.photo,
                  color: GlobalVariables.mainColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
