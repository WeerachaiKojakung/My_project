import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class LoginController extends GetxController {
  var _googleSignin = new GoogleSignIn();
  var googleAccount = new Rx<GoogleSignInAccount?>(null);

  login() async {
    googleAccount.value = await _googleSignin.signIn();
  }

  logout() async {
    googleAccount.value = await _googleSignin.signOut();
  }
} 