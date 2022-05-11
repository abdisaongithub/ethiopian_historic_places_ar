import 'package:ethiopian_historic_places_ar/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'SplashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushReplacementNamed(
          context,
          LandingScreen.id,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            const Expanded(
              child: Text(
                'Ethiopian Historic \nPlaces',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Macondo',
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(
                height: 30,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'In Collaboration With',
                  style: TextStyle(),
                ),
                SizedBox(
                  height: 70,
                  // width: MediaQuery.of(context).size.width - 30,
                  child: Image.asset(
                    'assets/img/or.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
