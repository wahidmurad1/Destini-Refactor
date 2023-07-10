import 'package:destini/controller/getxController/story_data.dart';
import 'package:get/instance_manager.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoryData>(() => StoryData());
  }
}
