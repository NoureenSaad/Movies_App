import 'package:dio/dio.dart';
import 'package:movies_app/core/constants.dart';

class ApiManager{
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseURL,
        queryParameters: {
          "api_key":Constants.apiKey
        }
      )
    );
  }

  Future<Response> getRequest({required String endpoint, Map<String,dynamic>? queryParameters})async{
    var response = await dio.get(endpoint,queryParameters: queryParameters);
    return response;
  }

  Future<Response> postRequest({required String endpoint, Map<String,dynamic>? body}) async{
    var response = await dio.post(endpoint,data: body);
    return response;
  }
}