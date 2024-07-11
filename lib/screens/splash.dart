import 'package:flutter/material.dart';
import 'package:news_app/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHomePage();
  }

  goToHomePage() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6.0, top: 150),
            child: Image.network(
              "https://img.freepik.com/premium-vector/badge-news-logo-modern-flat-pictogram-business-marketing-internet-concept-symbol-website-design-buttons-mobile-app-news-vector-icon-globe-symbol-world_340607-38.jpg",
              height: 400,
            ),
          ),
          const Center(
            child: Text(
              "Smart News App",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          )
        ],
      ),
    );
  }
}
