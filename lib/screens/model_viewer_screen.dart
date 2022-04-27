import 'package:flutter/material.dart';
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

  playTTS() async {
    await flutterTts.speak('Hello, How are you? I am fine, and Thank you.');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playTTS();
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
          backgroundColor: Colors.blueGrey,
          // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          src: args.source, // a bundled asset file
          alt: args.alt,
          ar: true,
          key: widget.key,
          arModes: const ['scene-viewer', 'webxr', 'quick-look'],
          autoRotate: true,
          cameraControls: true,
          arScale: 'auto',
        ),
      ),
    );
  }
}

class ModelViewerScreenArgument {
  final String source;
  final String alt;

  ModelViewerScreenArgument({required this.alt, required this.source});
}
