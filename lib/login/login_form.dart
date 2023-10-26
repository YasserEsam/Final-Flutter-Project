import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController =
      TextEditingController();

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _loginFormKey,
        child: Column(
          children: [
            ///start phone input

            TextFormField(
              controller: emailEditingController,
              maxLines: 2,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Your Email';
                }

                return null;
              },
              onChanged: (value) {},
              onSaved: (newValue) {},
            ),

            ///end phone input
            SizedBox(
              height: 10,
            ),

            ///start phone input
            TextFormField(
              controller: passwordEditingController,
              maxLines: 2,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter Your Password';
                }
                if (value.length <= 5 || value.isEmpty) {
                  return 'Short Password';
                }

                return null;
              },
              onChanged: (value) {},
              onSaved: (newValue) {},
            ),

            ///end phone input
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_loginFormKey.currentState!.validate()) {
                  // Get.find<UserController>().readUserData().then((value) {
                  //   if (Get.find<UserController>().user!.email ==
                  //           emailEditingController.text &&
                  //       Get.find<UserController>().user!.email ==
                  //           passwordEditingController.text) {
                  //     print("object ${  Get.find<UserController>().user!.email }");
                  //   }
                  // });
                }
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
