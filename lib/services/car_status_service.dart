import 'package:mod_android/api_address.dart';
import 'package:mod_android/model/car_status.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CarStatusService {
  Future<CarStatus> getCarStatus() async {
    var url = apiCarStatus;
    var headers = {
      'Content-Type': 'application/json',
    };
    // var authorization = {'Token': '$token'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      CarStatus carStatus = CarStatus.fromJson(data);
      return carStatus;
    } else {
      throw Exception('Failed to get car status!');
    }
  }
}
