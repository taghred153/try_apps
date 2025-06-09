import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final String name;
  final String weatherCondition;
  final String tempreature;
  final String imageUrl;
  const WeatherWidget({
    required this.name,
    required this.imageUrl,
    required this.tempreature,
    required this.weatherCondition
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUrl),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(width: 15),
              Text(tempreature, style: TextStyle(fontSize: 15)),
            ],
          ),
          SizedBox(height: 10),
          Text(weatherCondition, style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
