import 'package:ai_project/Data/Apis/stroke_api.dart';

class InputController {
  Map<String, int?> data = {
    "hypertension":1,
    "heart_disease":1
  };
  Future<dynamic> sendData() async {
    return await StrokeApi().sendToModel(data);
  }
}
