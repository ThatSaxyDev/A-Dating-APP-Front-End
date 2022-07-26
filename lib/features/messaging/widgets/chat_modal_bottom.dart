import 'dart:ui';

import 'package:dateen/common/skmodernist_text.dart';
import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:dateen/features/messaging/widgets/chats_info.dart';
import 'package:dateen/features/messaging/widgets/my_message_card.dart';
import 'package:dateen/features/messaging/widgets/sender_message_card.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CreateChatModalBottom extends StatefulWidget {
  const CreateChatModalBottom({Key? key}) : super(key: key);

  @override
  State<CreateChatModalBottom> createState() => _CreateChatModalBottomState();
}

class _CreateChatModalBottomState extends State<CreateChatModalBottom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius15 * 2),
          ),
          height: Dimensions.height100 * 7.3,
          child: Padding(
            padding: EdgeInsets.only(
                left: Dimensions.width42,
                right: Dimensions.width42,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height50,
                ),
                Row(
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
                                  GlobalVariables.storiesMessages[1]['image']),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SkModernistText(
                              text: GlobalVariables.storiesMessages[1]['name'],
                              fontWeight: FontWeight.w700,
                              size: Dimensions.font24,
                            ),
                            SizedBox(
                              height: Dimensions.height10 / 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.do_not_disturb_on_total_silence_rounded,
                                  color: GlobalVariables.mainColor,
                                  size: Dimensions.iconSize10 * 1.5,
                                ),
                                SkModernistText(
                                  text: 'Online',
                                  size: Dimensions.font10 * 1.3,
                                  color: Colors.grey.withOpacity(0.8),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: Dimensions.height50,
                      width: Dimensions.width50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.6),
                        ),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.more_vert_rounded,
                          color: GlobalVariables.mainColor,
                          size: Dimensions.iconSize10 * 2.5,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height10 * 2,
                ),
                Row(
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
                      text: '  Today  ',
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
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      if (messages[index]['isMe'] == true) {
                        return MyMessageCard(
                          text: messages[index]['text'].toString(),
                          time: messages[index]['time'].toString(),
                        );
                      }
                      return SenderMessageCard(
                        text: messages[index]['text'].toString(),
                        time: messages[index]['time'].toString(),
                      );
                    },
                  ),
                ),
                // SizedBox(
                //   height: Dimensions.height10 * 7,
                // )
              ],
            ),
          ),
        ),
        Positioned(
          // bottom: 45,
          left: Dimensions.width30,
          right: Dimensions.width30,
          bottom: MediaQuery.of(context).viewInsets.bottom - Dimensions.width10,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.radius15),
              bottomRight: Radius.circular(Dimensions.radius15),
            ),
            clipBehavior: Clip.antiAlias,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Container(
                height: Dimensions.height50,
                margin: EdgeInsets.only(bottom: Dimensions.height30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  color: Colors.black.withOpacity(0.1),
                ),
                child: TextField(
                  cursorColor: GlobalVariables.mainColor,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      color: GlobalVariables.mainColor,
                      fontSize: Dimensions.font10 * 1.7,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your message',
                    suffixIcon: Icon(
                      Icons.mic,
                      color: GlobalVariables.mainColor,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: 'Sk-Modernist',
                      fontSize: Dimensions.font14,
                      // fontWeight: FontWeight.w700,
                      color: GlobalVariables.mainColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
