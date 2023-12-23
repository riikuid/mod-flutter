import 'package:flutter/material.dart';
import 'package:mod_android/model/car_status.dart';
import 'package:mod_android/services/car_status_service.dart';

class CarStatusProvider with ChangeNotifier {
  CarStatus? _carStatus;
  CarStatus get carStatus => _carStatus!;

  set carStatus(CarStatus carStatus) {
    _carStatus = carStatus;
    notifyListeners();
  }

  Future<void> getCarStatus() async {
    try {
      CarStatus carStatus = await CarStatusService().getCarStatus();
      _carStatus = carStatus;
    } catch (e) {
      print(e);
    }
  }
}
