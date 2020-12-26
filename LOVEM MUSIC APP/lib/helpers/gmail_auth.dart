import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
class GmailAuth{
  GmailAuth._(){}
  static auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  static GoogleSignIn _googleSignIn = new GoogleSignIn();
  static Future<auth.User> login() async{
    GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn(); //for sign in
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication; //for authentication from sign in object
    auth.OAuthCredential oAuthCredential = auth.GoogleAuthProvider.credential(//fire base google authentication using google sign in  credentials from googleSignInAuthentication object
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken
    );
    auth.UserCredential userCredential = await _firebaseAuth.signInWithCredential(oAuthCredential);//signing in with user credentials
    auth.User user = userCredential.user;//taking basic information from user
    return user;
  }

  static Future<GoogleSignInAccount> logout() async {
    await _googleSignIn.signOut();
  }
}