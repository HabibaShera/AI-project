import 'package:ai_project/Data/Apis/stroke_api.dart';

class InputController {
  Map<String, int?> data = {};
  Future<dynamic> sendData() async {
    return await StrokeApi().sendToModel({"gender": 1, "age": 40, "hypertension": 0, "heart_disease": 0, "work_type": 1, "residence_type": 1, "avg_glucose_level": 10, "bmi": 100, "smoking_status": 1});
  }
}
