import 'package:destini/model/story_model.dart';
import 'package:get/get.dart';

class StoryData extends GetxController {
  List<StoryModel> storyData = [
    StoryModel(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: 'I\'ll hop in. Thanks for the help!',
        choice2: 'Better ask him if he\'s a murderer first.'),
    StoryModel(
        storyTitle: 'He nods slowly, unphased by the question.',
        choice1: 'At least he\'s honest. I\'ll climb in.',
        choice2: 'Wait, I know how to change a tire.'),
    StoryModel(
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: 'I love Elton John! Hand him the cassette tape.',
        choice2: 'It\'s him or me! You take the knife and stab him.'),
    StoryModel(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: 'Restart',
        choice2: ''),
    StoryModel(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: 'Restart',
        choice2: ''),
    StoryModel(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: 'Restart',
        choice2: '')
  ];

  String getStory() {
    return storyData[storyNumber.value].storyTitle;
  }

  String getChoice1() {
    return storyData[storyNumber.value].choice1;
  }

  String getChoice2() {
    return storyData[storyNumber.value].choice2;
  }

  RxInt storyNumber = 0.obs;

  void nextStory(int choiceNumber) {
    if (choiceNumber == 1 && storyNumber.value == 0) {
      storyNumber.value = 2;
    } else if (choiceNumber == 2 && storyNumber.value == 0) {
      storyNumber.value = 1;
    } else if (choiceNumber == 1 && storyNumber.value == 1) {
      storyNumber.value = 2;
    } else if (choiceNumber == 2 && storyNumber.value == 1) {
      storyNumber.value = 3;
    } else if (choiceNumber == 1 && storyNumber.value == 2) {
      storyNumber.value = 5;
    } else if (choiceNumber == 2 && storyNumber.value == 2) {
      storyNumber.value = 4;
    } else if (storyNumber.value == 3 ||
        storyNumber.value == 4 ||
        storyNumber.value == 5) {
      restart();
    }
  }

  void restart() {
    storyNumber.value = 0;
  }

  bool buttonShouldBeVisible() {
    //You could also just check if (_storyNumber < 3)
    if (storyNumber.value == 0 ||
        storyNumber.value == 1 ||
        storyNumber.value == 2) {
      return true;
    } else {
      return false;
    }
  }
}
