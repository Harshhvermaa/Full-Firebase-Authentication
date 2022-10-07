import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:pinput/pinput.dart';

class Phoneverification extends StatefulWidget {
  const Phoneverification({Key? key}) : super(key: key);

  @override
  State<Phoneverification> createState() => _PhoneverificationState();
}

class _PhoneverificationState extends State<Phoneverification> {

     var phoneNumber = Get.arguments;
     var verificationId;





      Future<void> verifyPhone() async{
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
      this.verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent = (String verId, [int? forceCodeResend]){
      this.verificationId = verId;
    } as PhoneCodeSent;
    final PhoneVerificationCompleted verifiedSuccess = (AuthCredential auth){};
    final PhoneVerificationFailed verifyFailed = (FirebaseAuthException e) {
      print('${e.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91"+phoneNumber,
      timeout: const Duration(seconds: 5),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,
    );
  }

    String _comingSms = 'Unknown';
    String _status = "You are not provided any otp";
    late TextEditingController _providedotp;

  Future<void> initSmsListener() async {

    String? comingSms;
    try {
      comingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      comingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;
    setState(() {
      _comingSms = comingSms!;
      print("====>Message: ${_status}");
       _providedotp.text; //used to set the code in the message to a string and setting it to a textcontroller. message length is 38. so my code is in string index 32-37.
    _status == "$comingSms";
    });
  }

//   _verifyphone() async {
//   await FirebaseAuth.instance.verifyPhoneNumber(
//     phoneNumber: "+91 $phoneNumber",
//     verificationCompleted: (PhoneAuthCredential credential ) async {
//       await FirebaseAuth.instance.signInWithCredential(credential)
//       .then((value) => Get.snackbar("Login", "Now you are a verified user"));
//     }, 
//     verificationFailed: (FirebaseException e) {
//       Get.snackbar("Alert", "$e");
//     }, 
//     codeSent: ( String VerificationID  , int? resendToken ) {
//       setState(() {
//          _verificationcode = VerificationID;
//       });
//     },
     
//     codeAutoRetrievalTimeout: (String VerificationID){
//        setState(() {
//          _verificationcode = VerificationID;
//       });
//     }
//     ,
//     timeout: Duration(seconds: 100) );

// }
@override
  void initState() {
    // TODO: implement initState
    verifyPhone();
     _providedotp = TextEditingController();
    initSmsListener();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 56,
      
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(51, 255, 0, 0)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromARGB(255, 67, 81, 94)),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.toNamed("/signin");
                        },
                        icon: Icon(
                          Icons.arrow_left,
                          size: 25,
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 0.0),
                      child: Text(
                        "Verification $phoneNumber",
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
              SizedBox(height: 50.0,),
              SizedBox(
                height: 250.0,
                width: 300.0,
                child: LottieBuilder.network("https://assets8.lottiefiles.com/packages/lf20_gysrp57x.json")
                ),
                SizedBox(height: 40.0,),
                Text(
                  
                        "OTP send to your mobile\n+91 ${Get.arguments}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.bebasNeue(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                      ),
    
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 40.0, right: 40.0,top: 50.0),
                  child: Pinput(
                  controller: _providedotp,
                  length: 6,
                  
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  
                  obscureText: true,
                  submittedPinTheme: submittedPinTheme,
                  
                   
                    showCursor: true,
                    onSubmitted: (pin) async {
                        try{
                await FirebaseAuth.instance.
                        signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId, smsCode: pin)).then((value) async {
                if(value != null){
                   Get.offAllNamed("/Apphomescreen");
                }
                        } );
                        }catch(e){
                FocusScope.of(context).unfocus();
                print(e);
                        }
                    },
                  ),
                ),
              ),
              Text("$_status"),
            ]
          )
        )
      ),
    );
  }
}


