import 'package:destini/const/custom_button.dart';
import 'package:destini/data/story_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  StoryData storyData = Get.find<StoryData>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          constraints: BoxConstraints.expand(),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Text(
                      storyData.getStory(),
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    titleText: storyData.getChoice1(),
                    onPressed: () {
                      storyData.nextStory(1);
                    },
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: storyData.getChoice1() == 'Restart'
                      ? SizedBox()
                      : CustomButton(
                          titleText: storyData.getChoice2(),
                          onPressed: () {
                            storyData.nextStory(2);
                          },
                          color: Colors.blueAccent,
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
