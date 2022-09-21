import 'package:get/get.dart';

//каждый раз при изменении запускать кодогенерацию
//для запуска кодогенерации flutter packages pub run build_runner build --delete-conflicting-outputs
//чтобы зарегистрировать как фабрику для GetIt и обращаться к сервис локатору через  MainSimpleStateManagement

class ChatControllerGetxState extends GetxController {
  static ChatControllerGetxState instance = Get.find<ChatControllerGetxState>();

  String test = 'test chat controller';
}
