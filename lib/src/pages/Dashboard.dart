import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';



class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _dateTime = '';
  String _weatherInfo = 'Loading...';

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now().toLocal().toString();
      });
    });

    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    final locationUrl = 'https://www.metaweather.com/api/location/search/?query=beijing';
    
    try {
      final locationResponse = await http.get(Uri.parse(locationUrl));

      if (locationResponse.statusCode == 200) {
        final locationData = json.decode(locationResponse.body);
        if (locationData.isNotEmpty) {
          final woeid = locationData[0]['woeid'];
          final weatherUrl = 'https://www.metaweather.com/api/location/$woeid/';

          final weatherResponse = await http.get(Uri.parse(weatherUrl));

          if (weatherResponse.statusCode == 200) {
            final weatherData = json.decode(weatherResponse.body);
            final weather = weatherData['consolidated_weather'][0];
            final weatherState = weather['weather_state_name'];
            final temperature = weather['the_temp'];

            setState(() {
              _weatherInfo = '$weatherState, ${temperature.toStringAsFixed(1)}°C';
            });
          }
        }
      }
    } catch (e) {
      print(e);
      setState(() {
        _weatherInfo = 'Network Error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页面'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(_dateTime, style: TextStyle(fontSize: 12)),
                Text(_weatherInfo, style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: Size(300, 300),
              painter: HumanFigurePainter(),
            ),
          ),
          Positioned(
            left: 100,
            top: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/hospitalNva');
              },
              child: Text('院内导航'),
            ),
          ),
          Positioned(
            right: 100,
            top: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/departmentSelection');
              },
              child: Text('健康追踪管理'),
            ),
          ),
          Positioned(
            left: 90,
            bottom: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/symptomCheck');
              },
              child: Text('智能问诊'),
            ),
          ),
          Positioned(
            right: 90,
            bottom: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/medicalScience');
              },
              child: Text('口腔科普'),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150),
              child: Text('点击屏幕与我互动吧!', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
  @override
 _DashboardPageState createState() => _DashboardPageState();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页面'),
      ),
      body: Stack(
        children: [
          Center(
            child: CustomPaint(
              size: Size(300, 300),
              painter: HumanFigurePainter(),
            ),
          ),
          Positioned(
            left: 100,
            top: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/hospitalNva');
              },
              child: Text('院内导航'),
            ),
          ),
          Positioned(
            right: 100,
            top: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/departmentSelection');
              },
              child: Text('健康追踪管理'),
            ),
          ),
          Positioned(
            left: 90,
            bottom: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/symptomCheck');
              },
              child: Text('智能问诊'),
            ),
          ),
          Positioned(
            right: 90,
            bottom: 150,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/medicalScience');
              },
              child: Text('口腔科普'),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 150),
              child: Text('点击屏幕与我互动吧!', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

class HumanFigurePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    canvas.drawCircle(Offset(size.width / 2, size.height / 4), 30, paint);

    canvas.drawLine(
      Offset(size.width / 2, size.height / 4 + 30),
      Offset(size.width / 2, size.height / 2 + 30),
      paint,
    );

    canvas.drawLine(
      Offset(size.width / 2 - 50, size.height / 3),
      Offset(size.width / 2 + 50, size.height / 3),
      paint,
    );

    canvas.drawLine(
      Offset(size.width / 2, size.height / 2 + 30),
      Offset(size.width / 2 - 50, size.height / 2 + 100),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2, size.height / 2 + 30),
      Offset(size.width / 2 + 50, size.height / 2 + 100),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
