import 'package:dio/dio.dart';
//import 'package:oct12/oct12.dart' as oct12;

import 'DTO/userAuthDTO/userAuthDTO.dart';

void main(List<String> arguments) async {
  var apiUrl = "https://36d1-82-179-118-132.ngrok-free.app/api/users/";
  var httpClient = Dio(BaseOptions(baseUrl: apiUrl));

  var userAuthDTO = UserAuthDTO(email: 'voxakuma@mail.com', password: 'luxiem');
  try {
   var response = await httpClient.post(
    '/login', 
    data: userAuthDTO.toJson(),
  );
  print(response.data);
  print(response.statusCode);
  } on DioException catch (e) {
    print(e.message);
    print(e.response?.statusCode);
  }

}
