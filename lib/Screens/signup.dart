import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_boarding_screen/firebasecontroller.dart';
class Signup extends GetWidget<FirebaseController> {
   Signup({Key? key}) : super(key: key);
   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  var _namecontroller = TextEditingController();
  var _emailcontroller = TextEditingController();
  var _passcontroller = TextEditingController();

  String? _namevalidator( String value ){
    if(value.length < 2){
      return "Something went wrong";
    }
    return null;
  }

 String? _emailvalidator(  value ){
    if(!GetUtils.isEmail(value)){
      return "Invalid Format";
    }return null;
  }
String? _passvalidator(String value){
  if(value.length < 6 ){
    return "Password must be more than 6";
  }return null;
}
  checklogin() {
    final isvalid = _formkey.currentState!.validate();
    if (!isvalid) {
      return;
    }
    _formkey.currentState!.save();
    print("saved");
    controller.Createuser(_namecontroller.text, _emailcontroller.text, _passcontroller.text);
    Get.toNamed("/signin");
    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(children: [
                IconButton(
                  onPressed: (){
                    Get.toNamed("/signin");
                  }, 
                  icon: Icon(Icons.arrow_left,size: 25,) ),
                  
              ],), ),
              SizedBox(height: 50.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 18.0),
                    child: Text(
                        "Create your\nAccount",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.bebasNeue(
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            wordSpacing: 4.0),
                      ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      
                      margin: EdgeInsets.only(left: 18.0,right: 18.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Color.fromARGB(255, 237, 237, 237)
                      ),
                      child: Container(
                        child: TextFormField(
                          controller: _namecontroller,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            
                           return _namevalidator(_namecontroller.text);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 17),
                            hintText: "Name",
                            focusColor: Colors.black,
                            hintStyle: TextStyle(color: Color.fromARGB(255, 215, 215, 215) ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                            prefixIcon: Padding(padding: EdgeInsets.only(top: 17.5,bottom: 17.5),
                            
                            child: Container(
                              child: Image(image: AssetImage("assets/user1.png"),height: 20.0,color: Color.fromARGB(255, 215, 215, 215),),
                            ),
                            )
                          ),
                        ),
                      ),
                    ),
                    Container(
                      
                      margin: EdgeInsets.only(left: 18.0,right: 18.0,top: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Color.fromARGB(255, 237, 237, 237)
                      ),
                      child: Container(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _emailcontroller,
                          validator: (value) {
                           return _emailvalidator(value);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 17),
                            hintText: "Email",
                            focusColor: Colors.black,
                            hintStyle: TextStyle(color: Color.fromARGB(255, 215, 215, 215) ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                            prefixIcon: Padding(padding: EdgeInsets.only(top: 15,bottom: 15.0),
                            
                            child: Container(
                              child: Image(image: AssetImage("assets/inbox.png"),height: 25.0,color: Color.fromARGB(255, 215, 215, 215),),
                            ),
                            )
                          ),
                        ),
                      ),
                    ),
                    Container(
                      
                      margin: EdgeInsets.only(left: 18.0,right: 18.0,top: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Color.fromARGB(255, 237, 237, 237)
                      ),
                      child: Container(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _passcontroller,
                          validator: (value) {
                           return _passvalidator(_passcontroller.text);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 17),
                            suffixIcon: Padding(padding: EdgeInsets.only(top: 15,bottom: 15),
                            child: Image(image: AssetImage("assets/hide.png"),height: 25.0,color:Color.fromARGB(255, 215, 215, 215) ,),
                             ),
                            hintText: "Password",
                            focusColor: Colors.black,
                            hintStyle: TextStyle(color: Color.fromARGB(255, 215, 215, 215) ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(12.0)
                            ),
                            prefixIcon: Padding(padding: EdgeInsets.only(top: 15,bottom: 15.0),
                            
                            child: Container(
                              child: Image(image: AssetImage("assets/padlock.png"),height: 25.0,color: Color.fromARGB(255, 215, 215, 215),),
                            ),
                            )
                          ),
                        ),
                      ),
                    ),
                    Container(
                  margin: EdgeInsets.only(left: 18.0, right: 18.0,top: 40.0 ),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        print(_emailcontroller.text);
                        checklogin();
                      },
                      child: Text(
                        "Sign up",
                        
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
                )),
                SizedBox(height: 30.0,),
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1.0,
                    width: 100.0,
                    color: Color.fromARGB(255, 237, 237, 237),
                  ),
                  Container(child: Text(" or continue with ",style: GoogleFonts.poppins(
                           color: Colors.grey, fontSize: 20.0,),),margin: EdgeInsets.symmetric(horizontal: 5.0),),
                  Container(
                    height: 1.0,
                    width: 100.0,
                    color: Color.fromARGB(255, 237, 237, 237),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 70.0,
                    height: 55.0,
                margin: EdgeInsets.only(top: 10.0),
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
                    ],
                  ),
                ),
              ),
              Container(
                    width: 70.0,
                    height: 55.0,
                margin: EdgeInsets.only(top: 10.0),
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
                          "assets/facebook.png",
                        ),
                        fit: BoxFit.cover,
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                    width: 70.0,
                    height: 55.0,
                margin: EdgeInsets.only(top: 10.0),
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
                          "assets/apple.png",
                        ),
                        fit: BoxFit.cover,
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
                ],
              )
          ],
        ),
      ),
    );
  }
}