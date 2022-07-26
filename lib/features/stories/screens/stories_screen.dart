import 'dart:ui';

import 'package:dateen/constants/dimensions.dart';
import 'package:dateen/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:story_time/story_time.dart';

class StoriesScreen extends StatefulWidget {
  static const String routeName = '/stories-screen';
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class UserModel {
  UserModel(this.stories, this.userName, this.imageUrl);

  final List<StoryModel> stories;
  final String userName;
  final String imageUrl;
}

class StoryModel {
  StoryModel(this.imageUrl);

  final String imageUrl;
}

class _StoriesScreenState extends State<StoriesScreen> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  final sampleUsers = [
    UserModel([
      StoryModel(
          "https://images.unsplash.com/photo-1601758228041-f3b2795255f1?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609418426663-8b5c127691f9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609444074870-2860a9a613e3?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609504373567-acda19c93dc4?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1MHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ], "User1",
        "https://images.unsplash.com/photo-1609262772830-0decc49ec18c?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMDF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    UserModel([
      StoryModel(
          "https://images.unsplash.com/photo-1609439547168-c973842210e1?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4Nnx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ], "User2",
        "https://images.unsplash.com/photo-1601758125946-6ec2ef64daf8?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzMjN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    UserModel([
      StoryModel(
          "https://images.unsplash.com/photo-1609421139394-8def18a165df?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1609377375732-7abb74e435d9?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxODJ8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      StoryModel(
          "https://images.unsplash.com/photo-1560925978-3169a42619b2?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMjF8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
    ], "User3",
        "https://images.unsplash.com/photo-1609127102567-8a9a21dc27d8?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzOTh8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
  ];

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
      IndicatorAnimationCommand(resume: true),
    );
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        onStoryIndexChanged: (int newStoryIndex) {
          print('newStoryInd: $newStoryIndex');
          if (newStoryIndex == 1) {
            indicatorAnimationController.value = IndicatorAnimationCommand(
              duration: const Duration(seconds: 20),
            );
          } else {
            indicatorAnimationController.value = IndicatorAnimationCommand(
              duration: const Duration(seconds: 5),
            );
          }
        },
        onPageBack: (int newPageIndex) {
          int oldPage = newPageIndex + 1;
          print("from oldPage:$oldPage to newPage:$newPageIndex");
        },
        onPageForward: (int newPageIndex) {
          int oldPage = newPageIndex - 1;
          print("from oldPage:$oldPage to newPage:$newPageIndex");
        },
        onStoryUnpaused: () {
          print("Story is unpaused!!");
        },
        onStoryPaused: () {
          print("Story is paused!!");
        },
        itemBuilder: (context, pageIndex, storyIndex) {
          final user = sampleUsers[pageIndex];
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: Image.network(
                  story.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 44, left: 8),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      user.userName,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              // if (pageIndex == 0)
              GestureDetector(
                onTap: () async {
                  indicatorAnimationController.value =
                      IndicatorAnimationCommand(
                    pause: true,
                  );
                },
                child: Container(
                  // padding: EdgeInsets.only(
                  //   bottom: MediaQuery.of(context).viewInsets.bottom -
                  //       Dimensions.width10,
                  // ),
                  alignment: Alignment(0, 0.9),
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: TextField(
                          cursorColor: GlobalVariables.mainColor,
                          decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                              color: GlobalVariables.mainColor,
                              fontSize: Dimensions.font10 * 1.7,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintText: 'Reply',
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
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // child: ElevatedButton(
                  //   child: const Text('show modal bottom sheet'),
                  //   onPressed: () async {
                  //     indicatorAnimationController.value =
                  //         IndicatorAnimationCommand(
                  //       pause: true,
                  //     );
                  //     await showModalBottomSheet(
                  //       context: context,
                  //       builder: (context) => SizedBox(
                  //         height: MediaQuery.of(context).size.height / 2,
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(24),
                  //           child: Text(
                  //             'indicator is now paused'
                  //             'Continue after closing the modal bottom sheet.',
                  //             style: Theme.of(context).textTheme.headline5,
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //     indicatorAnimationController.value =
                  //         IndicatorAnimationCommand(
                  //       resume: true,
                  //     );
                  //   },
                  // ),
                ),
              ),
            ],
          );
        },
        indicatorAnimationController: indicatorAnimationController,
        initialStoryIndex: (pageIndex) {
          if (pageIndex == 0) {
            return 1;
          }
          return 0;
        },
        pageLength: sampleUsers.length,
        storyLength: (int pageIndex) {
          return sampleUsers[pageIndex].stories.length;
        },
        onPageLimitReached: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
