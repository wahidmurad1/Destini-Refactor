import 'package:destini/const/utils/styles.dart';
import 'package:destini/controller/getxController/story_data.dart';
import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  const CenteredText({
    super.key,
    required this.storyData,
  });

  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Text(
          storyData.getStory(),
          textAlign: TextAlign.center,
          style: textStyles,
        ),
      ),
    );
  }
}
