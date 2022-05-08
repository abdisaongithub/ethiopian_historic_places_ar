import 'package:ethiopian_historic_places_ar/screens/exercise_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/model_viewer_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:new_im_animations/im_animations.dart';

class LandingScreen extends StatefulWidget {
  static String id = 'LandingScreen';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late FlutterSecureStorage _flutterSecureStorage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _flutterSecureStorage = const FlutterSecureStorage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
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
                      ModelViewerScreen.id,
                      arguments: ModelViewerScreenArgument(
                        alt: "",
                        source: 'assets/ar/adama.glb',
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.blue,
        child: ColorSonar(
          innerWaveColor: Colors.blue,
          middleWaveColor: Colors.blue.shade100,
          outerWaveColor: Colors.blue.shade50,
          waveFall: 8,
          waveMotion: WaveMotion.synced,
          waveMotionEffect: Curves.easeIn,
          duration: const Duration(
            milliseconds: 1000,
          ),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            ExerciseScreen.id,
          );
          if (kDebugMode) {
            print('DetectionScreen');
          }
        },
      ),
    );
  }
}
