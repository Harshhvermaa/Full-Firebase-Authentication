import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_boarding_screen/models/onboarding_content.dart';

class OnboardingScreeen extends StatefulWidget {
  const OnboardingScreeen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreeen> createState() => _OnboardingScreeenState();
}

class _OnboardingScreeenState extends State<OnboardingScreeen> {
  int currentindex = 0;
  late PageController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
       SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                      itemCount: pages.length,
                      onPageChanged: (int index) {
                        setState(() {
                          currentindex = index;
                        });
                      },
                      itemBuilder: (context, index) => Container(
                            child: Column(
                              children: [
                                Container(
                                    width: double.infinity,
                                    height: 520.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(pages[index].image) ,
                                                ))),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(pages[index].text,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.lato(
                                        fontSize: 35.0,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          )
                          ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0, top: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          pages.length,
                          (index) => dots( index,context))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if(currentindex == pages.length - 1 ){
                          Get.toNamed("/loginScreen");
                        }
                          _controller.nextPage(
                            duration: Duration(milliseconds: 300 ), 
                            curve: Curves.easeInOut);
                        
                      },
                      child: Text(
                        currentindex == pages.length - 1 ? "Continue" : "Next" ,
                        
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
      ),
    );
  }

  Container dots(int index,BuildContext context) {
    return Container(
                            margin: EdgeInsets.all(2.0),
                            height: 7,
                            width: currentindex == index ? 25.0 : 7.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: currentindex == index ? Colors.black : Colors.grey
                                ),
                          );
  }
}
