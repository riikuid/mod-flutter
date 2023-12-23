class CarStatus {
  late String temperature;
  late String origin;
  late String destination;
  late String nextStation;

  CarStatus({
    required this.temperature,
    required this.origin,
    required this.destination,
    required this.nextStation,
  });

  CarStatus.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    origin = json['origin'];
    destination = json['destination'];
    nextStation = json['next_station'];
  }
}
