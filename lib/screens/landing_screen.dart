import 'package:ethiopian_historic_places_ar/screens/all_models_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/exercise_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/help_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_im_animations/im_animations.dart';

class LandingScreen extends StatefulWidget {
  static String id = 'LandingScreen';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late FlutterSecureStorage _flutterSecureStorage;
  late String? lang;

  @override
  void initState() {
    _flutterSecureStorage = const FlutterSecureStorage();
    getLang();
    super.initState();
  }

  void getLang() async {
    lang = await _flutterSecureStorage.read(key: 'lang');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                LandingScreenButton(
                  label: 'Scan',
                  iconData: Icons.search,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ExerciseScreen.id,
                    );
                  },
                ),
                LandingScreenButton(
                  label: 'All Models',
                  iconData: FontAwesomeIcons.monument,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AllModelsScreen.id,
                    );
                  },
                ),
                LandingScreenButton(
                  label: 'Languages',
                  iconData: Icons.language,
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   ModelViewerScreen.id,
                    //   arguments: ModelViewerScreenArgument(
                    //     alt: "",
                    //     source: 'assets/ar/adama.glb',
                    //   ),
                    // );
                  },
                ),
                LandingScreenButton(
                  label: 'Help',
                  iconData: FontAwesomeIcons.question,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HelpScreen.id,
                    );
                  },
                ),
                LandingScreenButton(
                  label: 'Quit',
                  iconData: Icons.logout,
                  onTap: () {
                    SystemNavigator.pop(
                      animated: true,
                    );
                  },
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

class LandingScreenButton extends StatelessWidget {
  const LandingScreenButton({
    Key? key,
    required this.label,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.75),
            width: 2,
            style: BorderStyle.solid,
          ),
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 80,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(4),
              child: Icon(
                iconData,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
