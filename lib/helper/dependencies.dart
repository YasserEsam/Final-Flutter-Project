import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/controller/user_controller.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ProductController());
  Get.lazyPut(() => UserController());
}
