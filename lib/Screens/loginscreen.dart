import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:on_boarding_screen/firebasecontroller.dart';

class LoginScreen extends GetWidget<FirebaseController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 25.0,
                    onPressed: () {
                      Get.toNamed("/onboardingscreen");
                    },
                    icon: Icon(Icons.chevron_left),
                  )
                ],
              ),
              // Lottie.network("https://assets3.lottiefiles.com/private_files/lf30_m6j5igxb.json",height: 250.0,width: 250, ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 70.0,bottom: 50.0),
                    child: SizedBox(
                      height: 120,
                      child: OverflowBox(
                        minHeight: 265,
                        maxHeight: 265,
                        child:  Lottie.network('https://assets3.lottiefiles.com/private_files/lf30_m6j5igxb.json'),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Let,s you in",
                style: GoogleFonts.bebasNeue(
                    fontSize: 55.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    wordSpacing: 3.0),
              ),
              GestureDetector(
                onTap: (){
                  controller.facebookLogin();
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: 25.0, right: 25.0, bottom: 10.0, top: 40),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.0, color: Color.fromARGB(255, 237, 237, 237)),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 35.0,
                        ),
                        Padding(padding: EdgeInsets.only(right: 10.0)),
                        Text(
                          "Continue with Facebook",
                          style: GoogleFonts.lato(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                 controller.Googlesignin();
                },
                child: Container(
                  margin: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.0, color: Color.fromARGB(255, 237, 237, 237)),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // CircleAvatar(backgroundImage: AssetImage("assets/google.png")) ,
                        Image(
                          image: AssetImage(
                            "assets/google.png",
                          ),
                          fit: BoxFit.cover,
                          height: 30.0,
                        ),
                        Padding(padding: EdgeInsets.only(right: 10.0)),
                        Text(
                          "Continue with Google",
                          style: GoogleFonts.lato(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25.0, right: 25.0,bottom: 30.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0, color: Color.fromARGB(255, 237, 237, 237)),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          "assets/apple.png",
                        ),
                        fit: BoxFit.cover,
                        height: 30.0,
                      ),
                      Padding(padding: EdgeInsets.only(right: 10.0)),
                      Text(
                        "Continue with Apple",
                        style: GoogleFonts.lato(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.0,
                    width: 100.0,
                    color: Color.fromARGB(255, 237, 237, 237),
                  ),
                  Container(child: Text("or",style: GoogleFonts.lato(
                           color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.bold),),margin: EdgeInsets.symmetric(horizontal: 5.0),),
                  Container(
                    height: 1.0,
                    width: 100.0,
                    color: Color.fromARGB(255, 237, 237, 237),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 25.0, right: 25.0, top: 30.0),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/signin");
                      },
                      child: Text(
                        "Sign in with password",
                        
                        style: GoogleFonts.lato(fontSize: 20.0, ) ,
                        
                      ),
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(12.0),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
