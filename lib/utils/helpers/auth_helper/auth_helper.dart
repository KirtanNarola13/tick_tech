import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();

  ///Verify Phone
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneNumber}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieve verification code
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('Error', 'Provided phone number is not valid');
        } else {
          Get.snackbar('Error', 'Something went wrong');
        }
      },
      codeSent: (String verify, int? resendToken) async {
        this.verificationId = verify;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
      },
      timeout: const Duration(seconds: 60),
    );
  }

  Future<bool> verifyOtp(String otp) async {
    var credential = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp));
    return credential.user != null ? true : false;
  }
}
