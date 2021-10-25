// import 'package:dio/dio.dart';
// import 'package:shop/const/variables.dart';
//
// class DioHelper {
//   static final _baseUrl = BASE_URL;
//
//   static Dio dioSingleton = Dio()..options.baseUrl = _baseUrl;
//
//   static Future<Response<dynamic>> post(String path,
//       {Map<String, dynamic>? body}) {
//     // dioSingleton.options.headers = {
//     //   'Authorization': 'Bearer ${currentLoggedUser.apiToken}',
//     //   'apitoken': currentLoggedUser.apiToken,
//     // };
//     final response = dioSingleton.post(path, data: FormData.fromMap(body!));
//     dioSingleton.options.headers = null;
//     return response;
//   }
//
//   static Future<Response<dynamic>> get(String path) {
//     // dioSingleton.options.headers = {
//     //   'Authorization': 'Bearer ${currentLoggedUser.apiToken}',
//     //   'apitoken': currentLoggedUser.apiToken,
//     // };
//     final response = dioSingleton.get(path);
//     dioSingleton.options.headers = null;
//     return response;
//   }
// }
//   static Future<Response<dynamic>> patch(String path,
//       {Map<String, dynamic> body}) {
//     dioSingleton.options.headers = {
//       'Authorization': 'Bearer ${currentLoggedUser.apiToken}',
//       'apitoken': currentLoggedUser.apiToken,
//     };
//     final response = dioSingleton.patch(path, data: FormData.fromMap(body));
//     dioSingleton.options.headers = null;
//     return response;
//   }
//
//   static Future<Response<dynamic>> put(String path,
//       {Map<String, dynamic> body, dynamic formData}) {
//     dioSingleton.options.headers = {
//       'Authorization': 'Bearer ${currentLoggedUser.apiToken}',
//       'secret': 'FtAdHjYgA2dtujT9civRD7BRZuZRZqSCQhZMeHlAsT',
//     };
//     final response = dioSingleton.put(path,
//         data: formData != null ? formData : FormData.fromMap(body));
//     dioSingleton.options.headers = null;
//     return response;
//   }
//
//   static Future<Response<dynamic>> delete(String path,
//       {Map<String, dynamic> body}) {
//     dioSingleton.options.headers = {
//       'Authorization': 'Bearer ${currentLoggedUser.apiToken}',
//       'apitoken': currentLoggedUser.apiToken,
//     };
//     final response = dioSingleton.delete(path, data: FormData.fromMap(body));
//     dioSingleton.options.headers = null;
//     return response;
//   }
// }
