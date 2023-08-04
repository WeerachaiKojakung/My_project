import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends GetxController {
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  final Rx<GoogleSignInAccount?> googleAccount = new Rx<GoogleSignInAccount?>(null);

  Future<void>  checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      googleAccount.value = await _googleSignIn.signInSilently();
    }
  }

  login() async {
    googleAccount.value = await _googleSignIn.signIn();
  }

  logout() async {
    googleAccount.value = await _googleSignIn.signOut();
  }
} 