import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/messaging/widgets/chat_modal_bottom.dart';
import 'package:dateen/features/stories/screens/stories_screen.dart';
import 'package:flutter/material.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    return Scaffold(
      appBar: ScrollAppBar(
        controller: controller,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 160,
        title: Padding(
          padding: EdgeInsets.only(left: Dimensions.width20),
          child: SkModernistText(
            text: 'Messages',
            size: Dimensions.iconSize10 * 3.4,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: Dimensions.width10 * 3.8,
              top: Dimensions.height10 * 2.5,
              bottom: Dimensions.height10 * 2.5,
            ),
            child: Container(
              height: Dimensions.height50,
              width: Dimensions.width50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(Dimensions.radius15),
              ),
              child: Center(
                child: Icon(
                  Icons.menu,
                  color: GlobalVariables.mainColor,
                  size: Dimensions.iconSize10 * 2.5,
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 * 3.4),
            height: Dimensions.height110 / 2,
            child: TextField(
              cursorColor: GlobalVariables.mainColor,
              decoration: InputDecoration(
                floatingLabelStyle: TextStyle(
                  color: GlobalVariables.mainColor,
                  fontSize: Dimensions.font10 * 1.7,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixIcon: const Icon(
                  Icons.search,
                  color: GlobalVariables.mainColor,
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: Dimensions.font14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: GlobalVariables.mainColor),
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        controller: controller,
        physics: const ScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimensions.height20),
            height: Dimensions.height100 * 1.3,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: GlobalVariables.storiesMessages.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(left: Dimensions.width20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              StoriesScreen.routeName,
                            );
                          },
                          child: CircleAvatar(
                            radius: Dimensions.height10 * 5,
                            backgroundColor: GlobalVariables.mainColor,
                            child: CircleAvatar(
                              radius: Dimensions.height10 * 4.8,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: Dimensions.height10 * 4.6,
                                backgroundImage: AssetImage(GlobalVariables
                                    .storiesMessages[index]['image']),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height10 / 2,
                        ),
                        SkModernistText(
                          text: GlobalVariables.storiesMessages[index]['name'],
                          fontWeight: FontWeight.w700,
                          size: Dimensions.font14,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),
          SizedBox(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: GlobalVariables.storiesMessages.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(Dimensions.radius15 * 2),
                        ),
                      ),
                      context: context,
                      builder: (context) => const CreateChatModalBottom(),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          // bottom: Dimensions.height10,
                          left: Dimensions.width10 * 3,
                          right: Dimensions.width10 * 3,
                        ),
                        height: Dimensions.height10 * 7,
                        // color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: Dimensions.height10 * 3.2,
                                  backgroundColor: GlobalVariables.mainColor,
                                  child: CircleAvatar(
                                    radius: Dimensions.height10 * 3,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: Dimensions.height10 * 2.8,
                                      backgroundImage: AssetImage(
                                          GlobalVariables
                                                  .storiesMessages[index]
                                              ['image']),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimensions.width10,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SkModernistText(
                                      text: GlobalVariables
                                          .storiesMessages[index]['name'],
                                      fontWeight: FontWeight.w700,
                                      size: Dimensions.font16,
                                    ),
                                    SizedBox(
                                      height: Dimensions.height10 / 5,
                                    ),
                                    SkModernistText(
                                      text: GlobalVariables
                                          .storiesMessages[index]['text'],
                                      size: Dimensions.font14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SkModernistText(
                              text: GlobalVariables.storiesMessages[index]
                                  ['time'],
                              color: Colors.grey.withOpacity(0.9),
                              size: Dimensions.font14,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        indent: Dimensions.width100,
                        endIndent: Dimensions.width10 * 3,
                        thickness: Dimensions.height10 * 0.05,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
