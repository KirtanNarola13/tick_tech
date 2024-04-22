import 'package:reaching_tick_tech/header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            const Expanded(
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'PoetsenOne',
                  color: Color(0xFF4285F4),
                ),
              ),
            ),
            Expanded(
              child: Image.asset('assets/phone_verify.png'),
            ),
            Expanded(
              child: Container(
                child: Text(""),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
