import 'package:ethiopian_historic_places_ar/language_provider.dart';
import 'package:ethiopian_historic_places_ar/screens/all_models_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/exercise_screen.dart';
import 'package:ethiopian_historic_places_ar/screens/help_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_im_animations/im_animations.dart';

class LandingScreen extends ConsumerStatefulWidget {
  static String id = 'LandingScreen';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  // late FlutterSecureStorage _flutterSecureStorage;
  // late String? lang;

  @override
  void initState() {
    // _flutterSecureStorage = const FlutterSecureStorage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var words = ref.watch(languageProvider);

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
                  label: words[0],
                  iconData: Icons.search,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ExerciseScreen.id,
                    );
                  },
                ),
                LandingScreenButton(
                  label: words[1],
                  iconData: FontAwesomeIcons.monument,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AllModelsScreen.id,
                    );
                  },
                ),
                LandingScreenButton(
                  label: words[2],
                  iconData: Icons.language,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (BuildContext localContext,
                              void Function(void Function()) setState) {
                            return Container(
                              height: 150,
                              color: Colors.indigo,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const Text(
                                      'Choose Language',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 22,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Wrap(
                                      // direction: Axis.horizontal,
                                      alignment: WrapAlignment.center,
                                      children: [
                                        LanguageButton(
                                          onTap: () {
                                            // _flutterSecureStorage.write(
                                            //   key: 'lang',
                                            //   value: 'or',
                                            // );
                                            words = ref
                                                .read(languageProvider.notifier)
                                                .setLanguage('or');
                                            Navigator.pop(context);
                                          },
                                          label: 'Afaan Oromoo',
                                        ),
                                        LanguageButton(
                                          onTap: () {
                                            // _flutterSecureStorage.write(
                                            //   key: 'lang',
                                            //   value: 'am',
                                            // );
                                            words = ref
                                                .read(languageProvider.notifier)
                                                .setLanguage('am');
                                            Navigator.pop(context);
                                          },
                                          label: 'Amharic',
                                        ),
                                        LanguageButton(
                                          onTap: () {
                                            // _flutterSecureStorage.write(
                                            //   key: 'lang',
                                            //   value: 'en',
                                            // );
                                            words = ref
                                                .read(languageProvider.notifier)
                                                .setLanguage('en');
                                            Navigator.pop(context);
                                          },
                                          label: 'English',
                                        ),
                                        LanguageButton(
                                          onTap: () {
                                            // _flutterSecureStorage.write(
                                            //   key: 'lang',
                                            //   value: 'tg',
                                            // );
                                            words = ref
                                                .read(languageProvider.notifier)
                                                .setLanguage('tg');
                                            Navigator.pop(context);
                                          },
                                          label: 'Tigrigna',
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                LandingScreenButton(
                  label: words[3],
                  iconData: FontAwesomeIcons.question,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      HelpScreen.id,
                    );
                  },
                ),
                LandingScreenButton(
                  label: words[4],
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

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
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
