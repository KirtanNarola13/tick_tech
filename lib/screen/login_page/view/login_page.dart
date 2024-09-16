import 'dart:developer';

import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:reaching_tick_tech/header.dart';
import 'package:reaching_tick_tech/screen/Home/view/home.dart';
import 'package:reaching_tick_tech/utils/helpers/auth_helper/auth_helper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    GlobalKey formKey = GlobalKey<FormState>();
    TextEditingController phoneController = TextEditingController();
    TextEditingController otpController = TextEditingController();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.1,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'PoetsenOne',
                    color: Color(0xFF00509D),
                  ),
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Container(
                  width: w * 0.7,
                  height: h * 0.2,
                  child: Image.asset(
                    'assets/phone_verify.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Container(
                  height: h * 0.2,
                  width: w * 0.9,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                    border: Border.all(
                      color: const Color(0xff4285F4),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xff4285F4),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xff4285F4),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xff4285F4),
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.phone,
                            size: 22,
                            color: Color(0xff4285F4),
                          ),
                          hintText: 'Enter mobile number',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        cursorColor: const Color(0xff4285F4),
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter valid number';
                          } else if (value.length != 10) {
                            return 'Please enter valid number';
                          }
                          return null;
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          if (phoneController.text.isNotEmpty &&
                              phoneController.text.length == 10) {
                            AuthHelper.authHelper
                                .verifyPhoneNumber(phoneController.text)
                                .then((val) {
                              log("VerifyingPhone");
                              showDialogBox(
                                context,
                                phoneNumber: phoneController.text,
                                otpController: otpController,
                              );
                            });
                            // AuthHelper.authHelper
                            //     .requestOtp(phoneController.text);
                          } else {
                            Get.snackbar('Error', 'Please enter valid number');
                          }
                        },
                        child: Container(
                          height: h * 0.06,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 5,
                                offset: Offset(2, 3),
                              ),
                            ],
                            color: Color(0xff4285f4),
                          ),
                          child: Text(
                            "Login Using OTP",
                            style: GoogleFonts.mPlusRounded1c().copyWith(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: h * 0.15,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'By Clicking on Button,',
                        style: GoogleFonts.rosario().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'you are agree to ',
                            style: GoogleFonts.rosario().copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Reaching\'s, Desclamers',
                            style: GoogleFonts.rosario().copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff4285F4),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Privacy Policy and Terms & Conditions.',
                        style: GoogleFonts.rosario().copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4285F4),
                          decoration: TextDecoration.underline,
                          decorationColor: const Color(0xff4285F4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDialogBox(BuildContext context,
      {required String phoneNumber,
      required TextEditingController otpController}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.close,
                ),
              )
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Enter the OTP you receive to"),
              const SizedBox(
                height: 5,
              ),
              Text("+91 $phoneNumber"),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                focusedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xff4285F4),
                    ),
                  ),
                ),
                length: 6,
                onChanged: (val) {
                  otpController.text = val;
                },
                onSubmitted: (otp) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    log("Otp = ${otpController.text}");
                    AuthHelper.authHelper.verifyOtp(otpController.text).then(
                      (val) {
                        log("Otp Status = $val");
                        if (val == true) {
                          Get.offAll(Home());
                          Get.snackbar('Success', 'Login Successful');
                        } else
                          Get.snackbar('Error', 'Login Failed');
                      },
                    );
                  },
                  child: Container(
                    height: 39,
                    width: 197,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color(0xff00509D),
                    ),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
