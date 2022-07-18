import 'package:demo_project/db/app_db.dart';
import 'package:flutter/material.dart';
import 'package:demo_project/weather_add.dart';

class WeatherList extends StatefulWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  State<WeatherList> createState() => _WeatherList();
}

class _WeatherList extends State<WeatherList> {
  late AppDb _db;
  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather List'),
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WeatherAdd()),
                    )
                  },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder<List<WeatherData>>(
        future: _db.getWeathers(),
        builder: (context, snapshot) {
          final List<WeatherData>? listWeather = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (listWeather != null) {
            return ListView.builder(
                itemCount: listWeather.length,
                itemBuilder: (context, index) {
                  final weather = listWeather[index];
                  return Card(
                    child: Column(children: [
                      Text('Id: ${weather.id.toString()}'),
                      Text('Position: ${weather.position.toString()}'),
                      Text('Condition: ${weather.condition.toString()}'),
                      Text('Max temp: ${weather.maxTemp.toString()}'),
                      Text('Temp: ${weather.temp.toString()}'),
                      Text('Min temp: ${weather.minTemp.toString()}')
                    ]),
                  );
                });
          }
          return const Text('No data is found');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WeatherAdd()),
          )
        },
        //tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
