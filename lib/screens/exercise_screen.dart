import 'dart:io';

import 'package:ethiopian_historic_places_ar/classifier/classifier.dart';
import 'package:ethiopian_historic_places_ar/classifier/classifier_quant.dart';
import 'package:ethiopian_historic_places_ar/screens/model_viewer_screen.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class ExerciseScreen extends StatefulWidget {
  static String id = 'ExerciseScreen';
  const ExerciseScreen({Key? key}) : super(key: key);

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  late Classifier _classifier;

  bool picked = false;
  File? _image;
  final picker = ImagePicker();

  Image? _imageWidget;

  Category? category;

  @override
  void initState() {
    super.initState();
    _classifier = ClassifierQuant();
    getImage();
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      picked = true;
      _image = File(pickedFile!.path);
      _imageWidget = Image.file(_image!);

      _predict();
    });
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    final pred = _classifier.predict(imageInput);
    if ((pred.score * 10000).toInt() > 30) {
      if (pred.label == 'adama') {
        Navigator.popAndPushNamed(
          context,
          ModelViewerScreen.id,
          arguments: ModelViewerScreenArgument(
            alt: 'Adama',
            source: 'assets/ar/adama.glb',
          ),
        );
        return;
      }
      if (pred.label == 'axum') {
        Navigator.popAndPushNamed(
          context,
          ModelViewerScreen.id,
          arguments: ModelViewerScreenArgument(
            alt: 'Adama',
            source: 'assets/ar/axum.glb',
          ),
        );
        return;
      }
      if (pred.label == 'lalibela') {
        Navigator.popAndPushNamed(
          context,
          ModelViewerScreen.id,
          arguments: ModelViewerScreenArgument(
            alt: 'Adama',
            source: 'assets/ar/lalibel.glb',
          ),
        );
        return;
      }
    }
    setState(() {
      category = pred;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (category != null) {
      // if (category!.score == 0.004)
      if (kDebugMode) {
        print(category!.score * 10000);
        print(category!.label);
      }
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('TfLite Flutter Helper',
      //       style: TextStyle(color: Colors.white,),),
      // ),
      body: Column(
        children: <Widget>[
          Center(
            child: _image == null
                ? const Text('No image selected.')
                : Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height / 2),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: _imageWidget,
                  ),
          ),
          const SizedBox(
            height: 36,
          ),
          Text(
            category != null ? category!.label : '',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            category != null
                ? 'Confidence: ${category!.score.toStringAsFixed(3)}'
                : '',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}
