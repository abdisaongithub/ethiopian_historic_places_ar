import 'package:ethiopian_historic_places_ar/screens/exercise_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/model_viewer_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  static String id = 'LandingScreen';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ExerciseScreen.id,
                );
                if (kDebugMode) {
                  print('ToCameraScreen');
                }
              },
              height: 40,
              color: Colors.teal,
              child: const Text('Detect Image'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ModelViewerScreen.id,
                  arguments: ModelViewerScreenArgument(
                    alt: "",
                    source: 'assets/ar/adama_texture.glb',
                  ),
                );
              },
              height: 40,
              color: Colors.teal,
              child: const Text('Adama'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ModelViewerScreen.id,
                  arguments: ModelViewerScreenArgument(
                    alt: "",
                    source: 'assets/ar/axum.glb',
                  ),
                );
              },
              height: 40,
              color: Colors.teal,
              child: const Text('Axum'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ModelViewerScreen.id,
                  arguments: ModelViewerScreenArgument(
                    alt: "",
                    source: 'assets/ar/ja.glb',
                  ),
                );
              },
              height: 40,
              color: Colors.teal,
              child: const Text('Sheger'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ModelViewerScreen.id,
                  arguments: ModelViewerScreenArgument(
                    alt: "",
                    source: 'assets/ar/Astronaut.glb',
                  ),
                );
              },
              height: 40,
              color: Colors.teal,
              child: const Text('SampleModel - for reference'),
            ),
          ],
        ),
      ),
    );
  }
}
