import 'package:ethiopian_historic_places_ar/classifier/classifier.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class ClassifierQuant extends Classifier {
  ClassifierQuant({int numThreads: 1}) : super(numThreads: numThreads);

  @override
  String get modelName => 'models/saved_model.tflite';

  @override
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(0, 1);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 255);
}