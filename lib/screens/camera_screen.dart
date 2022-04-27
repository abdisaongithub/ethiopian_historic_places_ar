import 'package:camera/camera.dart';
import 'package:ethiopian_historic_places_ar/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';

class CameraScreen extends StatefulWidget {
  static String id = 'CameraScreen';

  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController cameraController;
  CameraImage? cameraImage;
  bool _isWorking = false;
  double? imageHeight;
  double? imageWidth;
  List<dynamic>? recognitionList;

  String models = 'assets/models/';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
    initCamera();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  initCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream(
          (streamImage) => {
            if (!_isWorking)
              {
                _isWorking = true,
                cameraImage = streamImage,
                runModelOnStream(streamImage),
              },
          },
        );
      });
    });
  }

  Future loadModel() async {
    Tflite.close();
    try {
      String? response = await Tflite.loadModel(
        model: models + 'saved_model.tflite',
        labels: models + 'labels.txt',
        isAsset: true,
        numThreads: 1,
        useGpuDelegate: false,
      );
      if (kDebugMode) {
        print(response);
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Unable to load model\n' + e.toString());
      }
    }
    // debugPrint('load model: end');
  }

  runModelOnStream(CameraImage image) async {
    // debugPrint('checking image: start');
    imageHeight = cameraImage!.height + 0.0;
    imageWidth = cameraImage!.width + 0.0;

    recognitionList = await Tflite.detectObjectOnFrame(
      bytesList: image.planes.map((e) {
        return e.bytes;
      }).toList(),
      model: 'saved_model.tflite',
      imageHeight: cameraImage!.height,
      imageWidth: cameraImage!.width,
      imageMean: 127.5,
      imageStd: 127.5,
      numResultsPerClass: 1,
      threshold: 0.4,
    ).then((value) {
      return null;
    });

    if (recognitionList != null) {
      debugPrint(recognitionList!.first.toString());
    }

    setState(() {
      _isWorking = false;
      cameraImage;
    });
  }

  List<Widget> displayBoxes(Size screen) {
    // debugPrint('display boxes: end');
    if (recognitionList == null) return [];
    if (imageWidth == null || imageHeight == null) return [];
    double factorX = screen.width;
    double factorY = imageHeight!;
    Color color = Colors.blue;
    return recognitionList!.map((result) {
      return Positioned(
        left: result['rect']['x'] * factorX,
        top: result['rect']['x'] * factorY,
        width: result['rect']['w'] * factorX,
        height: result['rect']['h'] * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            border: Border.all(color: color, width: 1.5),
          ),
          child: Text(
            result['deductedClass'] +
                (result['confidenceInClass'] * 100).toString(),
            style: TextStyle(
              color: color,
              fontSize: 14,
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> stackChildrenWidgets = [];
    stackChildrenWidgets.add(
      Positioned(
        top: 0.0,
        left: 0.0,
        width: size.width,
        height: size.height,
        child: SizedBox(
          height: size.height,
          child: !cameraController.value.isInitialized
              ? Container()
              : AspectRatio(
                  aspectRatio: cameraController.value.aspectRatio,
                  child: CameraPreview(
                    cameraController,
                  ),
                ),
        ),
      ),
    );

    if (cameraImage != null) {
      stackChildrenWidgets.addAll(displayBoxes(size));
    }

    return Scaffold(
      body: Stack(
        children: stackChildrenWidgets,
      ),
    );
  }
}
