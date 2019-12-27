import 'package:bloc_flutter_app_study/app/shared/config.dart';
import 'package:dio/dio.dart';

// Encapsudo o objeto dio e crio com minhas propriedades e regras de negócio
class CustomDio {
  Dio _dio = Dio();

  CustomDio() {
    _dio.options.baseUrl = ConfigConstants.API_URL;

    // Definindo interceptor para ser injetado nas classes de repository
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions reqOptions) {
          reqOptions.headers["Authentication"] =
              "Bearer bololohahahbolohahahah";
        },
        onError: (DioError err) {
          return err;
        },
        onResponse: (Response response) {
          return response;
        },
      ),
    );
  }

  Dio getClient() => this._dio;
}
