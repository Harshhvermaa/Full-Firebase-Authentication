import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class FirebaseController extends GetxController{
  
  FirebaseAuth _auth = FirebaseAuth.instance;

  late Rx<User?> _firebaseuser = Rx<User?>(_auth.currentUser);

  String? get user => _firebaseuser.value?.email;

@override
  void onInit() {
    // TODO: implement onInit
    _firebaseuser.bindStream(_auth.authStateChanges());
  }

  void Createuser(String Name,String Email,String Password) async {
    CollectionReference collectoion = FirebaseFirestore.instance.collection("Users");
    Map<String,String> data = {
        "Name" : Name,
        "Email" : Email,
        "Password" : Password,
    };

    await _auth.createUserWithEmailAndPassword(email: Email, password: Password)
    .then((value) => Get.snackbar( "Firebase Notification", "User Created Successfully"))
    .then((value) => collectoion.add(data)
    .then((value) => Get.toNamed("/signin"))
    .catchError((onError) => Get.snackbar("Hello", onError )));
    // .then((value) => collectoion.add(data).then((value) => Get.snackbar( "Hello $Name", "Nice to meet you"))
    // ).catchError((onError) => Get.snackbar("Failed to Sign up", onError) );
  }




  void Loginuser(String email,String password){
    _auth.signInWithEmailAndPassword(email: email, password: password)
    .then((value) => Get.snackbar( "Firebase Notification", "Login Successfully"))
    .then((value) => Get.offAllNamed("/imagepicker"));
    // .catchError((onError) => Get.snackbar( "Hello", onError)
     
  }

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
  Googlesignin() async {
     final GoogleSignInAccount? googleuser = await googleSignIn.signIn();

     final GoogleSignInAuthentication? googleauth = await googleuser?.authentication;

     final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleauth?.accessToken,
      idToken: googleauth?.idToken,
     );

     _auth.signInWithCredential(credential).then((value) => Get.offAllNamed("/imagepicker"));
  }

 facebookLogin() async {
  Map<String, dynamic>? _userData;

String welcome = "Facebook";



  final LoginResult result = await FacebookAuth.instance.login(permissions: ["email"]);
  final accesstoken = result.accessToken!.token;

  if (result.status == LoginStatus.success) {

  final userData = await FacebookAuth.instance.getUserData();
  _userData = userData;
  final  OAuthCredential credential = await FacebookAuthProvider.credential(result.accessToken!.token);
  print(userData);
  _auth.signInWithCredential(credential).then((value) => Get.snackbar("Success", "message")).catchError((onError)=> Get.offAllNamed("/imagepicker") );

}else{
  Get.snackbar("Error", "${result.message}");
}
 }
}