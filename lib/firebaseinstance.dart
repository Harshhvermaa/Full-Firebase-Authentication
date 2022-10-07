import 'package:get/get.dart';
import 'package:on_boarding_screen/firebasecontroller.dart';

class InstanceBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
  }
}