import 'package:ethiopian_historic_places_ar/screens/exercise_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/landing_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/model_viewer_screen.dart';
import 'package:flutter/material.dart';

// late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      initialRoute: LandingScreen.id,
      routes: {
        LandingScreen.id: (context) => const LandingScreen(),
        // CameraScreen.id: (context) => const CameraScreen(),
        ModelViewerScreen.id: (context) => const ModelViewerScreen(),
        ExerciseScreen.id: (context) => const ExerciseScreen(),
      },
    );
  }
}
