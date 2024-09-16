import 'package:firebase_core/firebase_core.dart';
import 'package:reaching_tick_tech/screen/Home/view/home.dart';
import 'package:reaching_tick_tech/screen/current_location/view/current_location.dart';

import 'firebase_options.dart';
import 'header.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/login_page', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const Home()),
        GetPage(name: '/current_location', page: () => const CurrentLocation()),
      ],
    ),
  );
}
