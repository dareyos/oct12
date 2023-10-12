import 'package:dio/dio.dart';
import 'DTO/userAuthDTO/userAuthDTO.dart';
import 'model/tokenData.dart';

void main(List<String> arguments) async {
  var apiUrl = "https://36d1-82-179-118-132.ngrok-free.app/api/users/";
  var httpClient = Dio(BaseOptions(baseUrl: apiUrl));
  var tokens = TokenData(access: "", refresh: "1");
  var userAuthDTO = UserAuthDTO(email: 'voxakuma@mail.com', password: 'luxiem123');
  
  try {
    var response = await httpClient.post( //мы залогинились
    '/login',
    data: userAuthDTO.toJson(),
  );
    tokens = TokenData.fromJson(response.data);
    print("Залогинились. Получили ACCESS, REFRESH");
    //! ЧТО-ТО ПОДЕЛАЛИ
    var oldRefreash = tokens.refresh;

    var res2 = await httpClient.post(
      '/refresh',
      data: tokens.toJson(),
    );
    print(response.data);
    var newtokens = TokenData.fromJson(res2.data);
    print(res2.data);
    var newRefresh = newtokens.refresh;
    print("Токены разные: ${oldRefreash != newRefresh}");

  } on DioException catch (e) { //сработает только тогда, когда дио вызовет исключение, переменная е имеет определенный тип - DioException
    print("ОШИБКА ОШИБКА ОШИБКА"); // в переменной е у нас есть ответ
    print(e.response?.statusCode);
    print(e.response?.data);
  }
}

slp(int ms) async {
  await Future.delayed(Duration(seconds: ms)); //отложенный по времени (просто ждет) duration - время
}