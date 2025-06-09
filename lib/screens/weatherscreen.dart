import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:try_apps/providers/weatherprovider.dart';
import 'package:try_apps/widgets/weatherwidget.dart';

class WeatherScreen extends StatelessWidget {

  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WeatherApp"),centerTitle: true),
      body: Center(
        child: Consumer<WeatherProvider>(
          builder: (context, value, child){
            var weather = value.weatherModel;
            if(weather == null)
              {
                value.fetchdata();
                return Center(child: CircularProgressIndicator());
              }
            else
              {
                return ListView.builder(
                    itemBuilder: (context, index){
                      var weath = weather.country[index];
                      return WeatherWidget(
                          name: weath["name"],
                          imageUrl: weath["imageUrl"],
                          tempreature: weath["tempreature"],
                          weatherCondition: weath["weatherCondition"]
                      );
                    },
                    itemCount: weather.country.length,
                );
              }
          },
        ),
      ),
    );
  }
}
