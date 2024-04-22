import 'package:google_fonts/google_fonts.dart';
import 'package:reaching_tick_tech/header.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
          const Spacer(
            flex: 4,
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/full_logo.png'),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Ensure Smiles When Reached!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  Get.to(const LoginPage());
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4285F4),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF000000).withOpacity(0.5),
                        blurRadius: 6,
                        spreadRadius: 0,
                        offset: const Offset(3, 5),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const LoginPage());
                    },
                    child: Row(
                      children: [
                        const Spacer(
                          flex: 5,
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            'Get Started',
                            style: GoogleFonts.poppins().copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(19.0),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.to(const LoginPage());
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF4285F4),
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
