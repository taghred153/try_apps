class WeatherModel{
  List<dynamic> country;
  WeatherModel({required this.country});
  factory WeatherModel.fromjson(Map<String, dynamic> json)
  {
    return WeatherModel(country: json["country"]);
  }
}