import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/auth/screens/main_%20sign_up.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingSCreen extends StatefulWidget {
  const OnboardingSCreen({Key? key}) : super(key: key);

  @override
  State<OnboardingSCreen> createState() => _OnboardingSCreenState();
}

class _OnboardingSCreenState extends State<OnboardingSCreen> {
  PageController pageController = PageController(viewportFraction: 0.8);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Dimensions.height10 * 7.6,
          ),
          SizedBox(
            height: Dimensions.height100 * 5.2,
            child: PageView.builder(
              controller: pageController,
              itemCount: GlobalVariables.onboardingImages.length,
              itemBuilder: (context, index) {
                return _buildPageItem(index);
              },
            ),
          ),

          //! dots
          DotsIndicator(
            dotsCount: GlobalVariables.onboardingImages.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              color: Colors.grey.withOpacity(0.7),
              activeColor: GlobalVariables.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),

          GestureDetector(
            onTap: () {
              Get.to(
                () => const SignUpScreen(),
              );
            },
            child: Container(
              height: Dimensions.height110 / 2,
              width: Dimensions.width100 * 3,
              margin: EdgeInsets.only(
                  top: Dimensions.height42, bottom: Dimensions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: GlobalVariables.mainColor,
              ),
              child: Center(
                child: SkModernistText(
                  text: 'Create an account',
                  size: Dimensions.font16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SkModernistText(
                text: 'Already have an account? ',
                size: Dimensions.font14,
              ),
              SkModernistText(
                text: 'Sign In',
                size: Dimensions.font14,
                color: GlobalVariables.mainColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  //! widget for the slider
  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Column(
        children: [
          Container(
            height: Dimensions.height100 * 3.6,
            width: Dimensions.height100 * 2.7,
            margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    GlobalVariables.onboardingImages[index]['image']!),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height50,
          ),
          SkModernistText(
            text: GlobalVariables.onboardingImages[index]['title']!,
            size: Dimensions.font24,
            color: GlobalVariables.mainColor,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          SkModernistText(
            text: GlobalVariables.onboardingImages[index]['description']!,
            size: Dimensions.font14,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
