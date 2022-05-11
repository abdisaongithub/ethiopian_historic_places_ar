import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerScreen extends StatefulWidget {
  static String id = 'ModelViewerScreen';
  const ModelViewerScreen({Key? key}) : super(key: key);

  @override
  _ModelViewerScreenState createState() => _ModelViewerScreenState();
}

class _ModelViewerScreenState extends State<ModelViewerScreen> {
  FlutterTts flutterTts = FlutterTts();
  late AudioPlayer _player;
  late FlutterSecureStorage _flutterSecureStorage;
  late int? rand;

  playTTS() async {
    await flutterTts.speak('Hello, How are you? I am fine, and Thank you.');
  }

  playAudio() async {
    await _player.play('', isLocal: true);
  }

  Future<String> checkLanguage() async {
    return 'or';
  }

  @override
  void initState() {
    super.initState();
    _flutterSecureStorage = const FlutterSecureStorage();
    _player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    rand = Random().nextInt(Colors.primaries.length - 1);
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
    rand = null;
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ModelViewerScreenArgument;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                // color: Colors.blueGrey,
                ),
            child: ModelViewer(
              // backgroundColor: Colors.primaries[rand!],
              backgroundColor: Colors.primaries[rand!],
              loading: Loading.eager,
              enablePan: true,
              scale: '0.1 0.1 0.1',
              // scale: ,
              // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
              src: args.source,
              alt: args.alt,
              ar: true,
              key: widget.key,
              arModes: const ['scene-viewer', 'webxr', 'quick-look'],
              autoRotate: true,
              cameraControls: true,
              arScale: ArScale.auto,
              arPlacement: ArPlacement.floor,
            ),
          ),
          SafeArea(
            top: true,
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const BackButton(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    args.alt.replaceFirst(
                      args.alt[0],
                      args.alt[0].toUpperCase(),
                    ),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                    onTap: () {
                      if (kDebugMode) {
                        print('Pause/Play');
                      }
                    },
                    child: const Icon(
                      Icons.pause,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ModelViewerScreenArgument {
  final String source;
  final String alt;

  ModelViewerScreenArgument({
    required this.alt,
    required this.source,
  });
}
