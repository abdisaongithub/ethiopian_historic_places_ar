import 'package:ethiopian_historic_places_ar/screens/all_models_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/exercise_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/help_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/landing_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/model_viewer_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// late List<CameraDescription> cameras;

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        LandingScreen.id: (context) => const LandingScreen(),
        // CameraScreen.id: (context) => const CameraScreen(),
        ModelViewerScreen.id: (context) => const ModelViewerScreen(),
        ExerciseScreen.id: (context) => const ExerciseScreen(),
        HelpScreen.id: (context) => const HelpScreen(),
        AllModelsScreen.id: (context) => const AllModelsScreen(),
        SplashScreen.id: (context) => const SplashScreen(),
      },
    );
  }
}
