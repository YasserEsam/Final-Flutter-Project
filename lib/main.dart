// import 'package:ecommerce/controller/user_controller.dart';
import 'package:ecommerce/screens/checkout.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;
import 'login/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GlobalKey tabkey = GlobalKey();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashin Shoes',
      theme: CustomTheme.getTheme(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          //Drawer
          drawer: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 77,
                    backgroundImage: AssetImage("images/ibrahim1.jpg"),
                  ),
                  accountName: Text(
                    "ibrahim & yasser",
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text(
                    "ib866150@gmail.com",
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                ListTile(
                  title: Text("Page one"),
                  leading: Icon(Icons.home),
                  onTap: () {},
                ),
                Divider(
                  color: Color.fromARGB(255, 160, 154, 154),
                ),
                ListTile(
                  title: Text("Home Page"),
                  leading: Icon(Icons.cloud_circle),
                ),
                Divider(
                  color: const Color.fromARGB(255, 190, 190, 190),
                ),
                ListTile(
                  title: Text("Contact Us"),
                  leading: Icon(Icons.app_blocking),
                  onTap: () {},
                ),
                Divider(
                  color: const Color.fromARGB(255, 190, 190, 190),
                ),
              ],
            ),
          ),
          //drawer
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Shoppers"),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                boxShadow: CustomTheme.cardShadow),
            child: const TabBar(
              padding: EdgeInsets.symmetric(vertical: 10),
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.person),
                ),
                Tab(
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ),
          body: TabBarView(
            key: tabkey,
            children: [
              HomeScreen(),
              LoginScreen(),
              CheckoutScreen(),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     // Get.find<UserController>()
          //     //     .writeUserData(email: "ibrayass@gmail.com", password: "123456");
          //   },
          // ),
        ),
      ),
    );
  }
}
