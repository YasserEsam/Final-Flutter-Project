import 'package:ecommerce/models/user.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  User? user;
  SharedPreferences? share;
  // Future writeUserData({required email, required password}) async {
  //   share = await SharedPreferences.getInstance();
  //   await share!.setString('userEmail', email.toString());
  //   await share!.setString('password', password.toString());

  // }

  // Future readUserData()async{
  // share = await SharedPreferences.getInstance();
  // user!.email= share!.getString('userEmail')??'user';
  // user!.password=share!.getString('password')??'pass';

  // }
}
