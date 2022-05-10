import 'package:audioplayers/audioplayers.dart';
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
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ModelViewerScreenArgument;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: ModelViewer(
          backgroundColor: Colors.blue,
          // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          src: args.source,
          alt: args.alt,
          ar: true,
          key: widget.key,
          arModes: const ['scene-viewer', 'webxr', 'quick-look'],
          autoRotate: true,
          cameraControls: true,
          arScale: ArScale.auto,
        ),
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
