import 'package:dio/dio.dart';

class StrokeApi {
  final requester = Dio(BaseOptions(baseUrl: 'https://stroke-api3.herokuapp.com'));

  Future<dynamic> sendToModel(Map<String, int?> data) async {
    try {
      var response = await requester.post("https://stroke-api3.herokuapp.com/predict", data: data);
      return response.data;
    } on DioError catch (e) {
      return {};
    }
  }
}
