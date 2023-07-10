import 'package:destini/const/utils/colors.dart';
import 'package:destini/const/utils/styles.dart';
import 'package:destini/controller/getxController/story_data.dart';
import 'package:destini/widgets/centered_text.dart';
import 'package:destini/widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final StoryData storyData = Get.find<StoryData>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          constraints: const BoxConstraints.expand(),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: CenteredText(storyData: storyData),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    titleText: storyData.getChoice1(),
                    onPressed: () {
                      storyData.nextStory(1);
                    },
                    color: button1Color,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: storyData.getChoice1() == 'Restart'
                      ? const SizedBox()
                      : CustomButton(
                          titleText: storyData.getChoice2(),
                          onPressed: () {
                            storyData.nextStory(2);
                          },
                          color: button2Color,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
