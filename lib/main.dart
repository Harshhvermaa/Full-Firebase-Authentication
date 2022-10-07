import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding_screen/Screens/homescreen.dart';

import 'package:on_boarding_screen/Screens/imagepickker.dart';
import 'package:on_boarding_screen/Screens/loginscreen.dart';
import 'package:on_boarding_screen/Screens/onboardingscreen.dart';
import 'package:on_boarding_screen/Screens/phoneverification.dart';
import 'package:on_boarding_screen/Screens/signin.dart';
import 'package:on_boarding_screen/Screens/signup.dart';
import 'package:on_boarding_screen/firebaseinstance.dart';
import 'firebase_options.dart';

Future<void> main(List<String> args) async {
   WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InstanceBinding(),
      initialRoute: "/onboardingscreen",
      getPages: [
        GetPage(name: "/onboardingscreen", page: () => OnboardingScreeen() ),
        GetPage(name: "/loginScreen", page: () => LoginScreen() ),
        GetPage(name: "/signup", page: () => Signup() ),
        GetPage(name: "/signin", page: () => Signin()),
        GetPage(name: "/imagepicker", page: () => Imagepicker()),
        GetPage(name: "/Phoneverification", page: () => Phoneverification()),
        GetPage(name: "/Apphomescreen", page: () => Apphome()),

        // GetPage(name: "onboardingscreen", page: () => OnboardingScreeen() ),

      ],
      debugShowCheckedModeBanner: false,
      home: OnboardingScreeen(),
      
    );
  }
}

