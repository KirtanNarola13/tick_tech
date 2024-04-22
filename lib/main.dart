import 'header.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => GetStarted()),
        GetPage(name: '/login_page', page: () => const LoginPage()),
      ],
    ),
  );
}
