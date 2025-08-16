import 'package:dio/dio.dart';

class ApiServes {
   final Dio _dio  ;
  final baseUrl = 'https://www.googleapis.com/books/v1/' ;

  ApiServes(this._dio) ; 

 Future<Map<String , dynamic >> get ({required String endBiond}) async {
    var response  = await _dio.get('$baseUrl$endBiond') ; 
    return response.data ;
  }
}
