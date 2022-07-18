import 'package:demo_project/db/app_db.dart';
import 'package:demo_project/weather_list.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;

class WeatherAdd extends StatefulWidget {
  const WeatherAdd({Key? key}) : super(key: key);

  @override
  State<WeatherAdd> createState() => _WeatherAdd();
}

class _WeatherAdd extends State<WeatherAdd> {
  late AppDb _db;
  TextEditingController placeController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  TextEditingController maxTempController = TextEditingController();
  TextEditingController tempController = TextEditingController();
  TextEditingController minTempController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  void dispose() {
    _db.close();
    placeController.dispose();
    conditionController.dispose();
    maxTempController.dispose();
    tempController.dispose();
    minTempController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Add'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: TextField(
              controller: placeController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Place')),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: TextField(
              controller: conditionController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Condition')),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: TextField(
              controller: maxTempController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Max Temp')),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: TextField(
              controller: tempController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Temp')),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: TextField(
              controller: minTempController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), label: Text('Min Temp')),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addWeather();
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  void addWeather() {
    final entity = WeatherCompanion(
        position: drift.Value(placeController.text),
        condition: drift.Value(conditionController.text),
        maxTemp: drift.Value(int.parse(maxTempController.text)),
        temp: drift.Value(int.parse(tempController.text)),
        minTemp: drift.Value(int.parse(minTempController.text)));

    // insert to db
    _db.insertWeather(entity).then((value) => {
          //print('$value'),
          if (value < 1)
            {
              ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                content: const Text(
                  'Insert the weather is errored!',
                  style: TextStyle(color: Colors.redAccent),
                ),
                actions: [
                  TextButton(
                    onPressed: () => {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                    },
                    child: const Text('Close'),
                  )
                ],
              ))
            }
          else
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const WeatherList()),
              )
            }
        });
  }
}
