import 'package:dio/dio.dart';
//import 'package:oct12/oct12.dart' as oct12;

import 'DTO/userAuthDTO/userAuthDTO.dart';
import 'model/tokenData.dart';

void main(List<String> arguments) async {
  var apiUrl = "https://36d1-82-179-118-132.ngrok-free.app/api/users/";
  var httpClient = Dio(BaseOptions(baseUrl: apiUrl));

  var userAuthDTO = UserAuthDTO(email: 'voxakuma@mail.com', password: 'luxiem123');
  try {
   var response = await httpClient.post(
    '/login', 
    data: userAuthDTO.toJson(),
  );
  var tokens = TokenData.fromJson(response.data);
  print(tokens);
  // print(response.statusCode);
  // print(response.data);
  } on DioException catch (e) {
    print(e.message);
    print(e.response?.statusCode);
  }

}
