import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Imagepicker extends StatefulWidget {
  const Imagepicker({Key? key}) : super(key: key);

  @override
  State<Imagepicker> createState() => _ImagepickerState();
}

class _ImagepickerState extends State<Imagepicker> {
  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = await File(image.path);
    setState(() => this.image = imageTemp);
  }
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>(); 



  var _nicknamecontroller = TextEditingController();
  var _dobcontroller = TextEditingController();
  var _emailcontroller = TextEditingController();
  var _phonecontroller = TextEditingController();

  _phonevalidator(String value){
    if( !GetUtils.isPhoneNumber(value)){
        return "Phone number is not valid";
    }else{
      return null;
    }
  }

  String? _emailvalidator(String value){
    if(!GetUtils.isEmail(value) ){
      return "Something went wrong";
    }else{
      return null;
    }
  }

  void checklogin() async {
    final isValid =  _formkey.currentState!.validate();
    if(!isValid){
      return;
    }else{
      _formkey.currentState!.save();
      CollectionReference reference = await FirebaseFirestore.instance.collection("Profiledata");
      Map<String,String> pdata = await {

        "Image" :  image!.toString(),
        "Nickname" : _nicknamecontroller.text,
        "DOB" : _dobcontroller.text,
        "Email" : _emailcontroller.text,
        "Phone number" : _phonecontroller.text,
      };

      await reference
      .add(pdata)
      .then((value) => Get.snackbar("Firebase", "Your data stored suceessfully"))
      .then((value) => Get.toNamed("/Phoneverification",arguments: _phonecontroller.text, ))
      .catchError((onError) => Get.snackbar("Firebase", "Your data stored suceessfully"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                       Get.off;
                      },
                      icon: Icon(
                        Icons.arrow_left,
                        size: 25,
                      )),
                  Container(
                    margin: EdgeInsets.only(left: 0.0),
                    child: Text(
                      "Fill your Profile",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.bebasNeue(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            GestureDetector(
              onTap: () {
                pickImage();
              },
              child: Stack(
                children: [
                  ClipOval(
                      child: image != null
                          ? Image.file(
                              image!,
                              height: 130,
                              width: 130,
                              fit: BoxFit.cover,
                            )
                          : Image(
                              image: AssetImage("assets/avatar.png"),
                              height: 130,
                              width: 130,
                            )),
                  Positioned(
                      bottom: 0.0,
                      right: 5.0,
                      child: Image(
                        image: AssetImage(
                          "assets/addimage.png",
                        ),
                        height: 30.0,
                        width: 30.0,
                      ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 70.0),
         
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromARGB(255, 237, 237, 237)),
              child: Form(
                key: _formkey,
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.0, ),
                    child: TextFormField(
                      controller: _nicknamecontroller,
                      style: TextStyle(fontSize: 22.0),
                      showCursor: true,
                      decoration: InputDecoration(
                          hintText: "Nickname",
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0 ),
                          hintStyle: TextStyle(fontSize: 22.0),
                          border: InputBorder.none),
                    ),
                  )
                ],
              )),
            ),
            Container(
              margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0),
            
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromARGB(255, 237, 237, 237)),
              child: Form(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.0, ),
                    child: TextFormField(
                      controller: _dobcontroller,
                      style: TextStyle(fontSize: 22.0),
                      showCursor: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20.0 ),
                          hintText: "DOB",
                          hintStyle: TextStyle(fontSize: 22.0),
                          border: InputBorder.none),
                    ),
                  )
                ],
              )),
            ),
            Container(
              margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0),
              
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromARGB(255, 237, 237, 237)),
              child: Form(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.0, top: 0.0),
                    child: TextFormField(
                      
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: ((value) {
                       return _emailvalidator( _emailcontroller.text);
                      }  ),
                      controller: _emailcontroller,
                      style: TextStyle(fontSize: 22.0),
                      showCursor: true,
                      decoration: InputDecoration(
                          hintText: "Email",
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0 ),
                          hintStyle: TextStyle(fontSize: 22.0),
                          border: InputBorder.none),
                    ),
                  ),
                  
                ],
              )),
            ),
            Container(
              margin: EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0),
              
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color.fromARGB(255, 237, 237, 237)),
              child: Form(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15.0, top: 0.0),
                    child: TextFormField(
                      
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: ((value) {
                       return _phonevalidator( _phonecontroller.text);
                      }  ),
                      controller: _phonecontroller,
                      style: TextStyle(fontSize: 22.0),
                      showCursor: true,
                      decoration: InputDecoration(
                          hintText: "Phone number",

                          contentPadding: EdgeInsets.symmetric(vertical: 20.0 ),
                          hintStyle: TextStyle(fontSize: 22.0),
                          border: InputBorder.none),
                    ),
                  ),
                  
                ],
              )),
            ),
            Container(
              height: 50.0,
               margin: EdgeInsets.only(left: 18.0, right: 18.0,top: 40.0 ),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  checklogin();
                },
                style: ButtonStyle(
                  
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)))),
                child: Text(
                  "Sign in",
                  style: GoogleFonts.lato(
                    fontSize: 20.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
