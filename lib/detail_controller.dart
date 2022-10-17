import 'package:get/get.dart';

class DetailController extends GetxController {
  var fav = 0.obs;
  void favCounter() {
    if (fav.value == 1) {
      Get.snackbar("Loved it", "You already loved it");
    } else {
      fav.value++;
      Get.snackbar("Loved it", "You just loved it");
    }
  }

  var fav1 = 0.obs;
  void favCounter1() {
    if (fav1.value == 1) {
      Get.snackbar("Loved it", "You already loved this contest");
    } else {
      fav1.value++;
      Get.snackbar("Loved it", "You just loved this contest");
    }
  }
}
