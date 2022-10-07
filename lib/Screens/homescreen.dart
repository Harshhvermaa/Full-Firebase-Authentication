

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_boarding_screen/models/doctorlist.dart';
import 'package:on_boarding_screen/models/homeappliances.dart';
import 'package:on_boarding_screen/models/mostpopular.dart';

class Apphome extends StatefulWidget {
  const Apphome({Key? key}) : super(key: key);

  @override
  State<Apphome> createState() => ApphomeState();
}

class ApphomeState extends State<Apphome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
    child: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0,bottom: 10.0),
        child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 70.0,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.0),
                    child: CircleAvatar(
                      radius: 28.0,
                      backgroundImage: AssetImage("assets/shop7.jpg"),
                    ),
                  ),
                  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good morning",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: Color.fromARGB(255, 181, 180, 180)),
                            ),
                            Text(
                              "Peter Parker",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.bebasNeue(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                            ),
                          ],
                        ),
                  Container(
                    margin: EdgeInsets.only(left: 85.0),
                    child: Row(
                            children: [
                              Image(
                                image: AssetImage("assets/notification.png"),
                                height: 30.0,
                                width: 30.0,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10.0),
                                  child: Image(
                                    image: AssetImage("assets/heart.png"),
                                    height: 30.0,
                                    width: 30.0,
                                  )),
                            ],
                          ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: 55,
              padding: EdgeInsets.only(top: 5.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 237, 237, 237),
                borderRadius: BorderRadius.circular(12.0)
                
              ),
              child: TextField(
                
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 14.0, ),
                  hintText: "Search",
                  
                  focusColor: Colors.black,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search,size: 32.0,),
                  suffixIcon: Icon(Icons.menu),
                  suffixIconColor: Colors.black,
                  prefixIconColor: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25.0,bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                              "Special Offers",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                            ),
                  Text(
                              "See All",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 20.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  ),
                            ),
        
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: CarouselSlider(
                     items: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(image: AssetImage("assets/shop5.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(image: AssetImage("assets/shop6.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(image: AssetImage("assets/shop7.jpg"),fit: BoxFit.cover)
                        ),
                      )
                    ],
                    
                    options: CarouselOptions(
                       height: 200,
                      aspectRatio: 16/9,
                      
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 6),
                      autoPlayAnimationDuration: Duration(milliseconds: 1200),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      
                      ),
                   
                  ),
            ), 
            Container(
              height: 200.0,
              padding: EdgeInsets.only(top: 10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisSpacing: 4.0,), 
                itemCount: appliances.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context,i) => Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 18.0,bottom: 18.0),
                    // margin: EdgeInsets.only(bottom: 5.0),
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 237, 237, 237)
                        ),
                        child: Image.asset(appliances[i].logo)
                  ),
                 Text(
                                appliances[i].text,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.bebasNeue(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                    ),
                              ),
                ],
              )
                ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25.0,bottom: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                              "Most Popular",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                            ),
                  Text(
                              "See All",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 20.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  ),
                            ),
        
                ],
              ),
            ),
            Container(
              height: 70.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popular.length,
                itemBuilder: (context,i) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 12.0),
                    padding: EdgeInsets.only(left: 22.0,right: 22.0,top: 12,bottom: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black , width: 1.0 ),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.transparent
                    ),
                    child: Text(popular[i].name,style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold,),),
                  ),
                ],
              ) ),
            ),
            Container(
                  height: 194,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: doctorlist.length,
                    itemBuilder: (context,i) => Container(
                      margin: EdgeInsets.only(top:20.0,right: 10.0 ),
                  padding: EdgeInsets.only(top: 10.0,bottom: 20.0,left: 10.0,right: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color.fromARGB(255, 241, 241, 241 ,),),
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10)),
                        CircleAvatar(
                          
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              "https://images.pexels.com/photos/11386172/pexels-photo-11386172.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 230, 230, 230),
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.only(left:10.0 )),
                              Icon(Icons.star_border,color: Colors.yellow[800],),
                              Padding(padding: EdgeInsets.only(left: 5.0)),
                              Text("7.0"),
                              Padding(padding: EdgeInsets.only(right:15.0 )),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text("Mr. Suresh Kumar",style: TextStyle(color: Color.fromARGB(255, 87, 87, 87),fontSize: 15,letterSpacing: 0),),
                        
                      ],
                  ),
                    ), ),
        )
        ],
        ),
      ),
    ),
      ),
    );
  }
}
