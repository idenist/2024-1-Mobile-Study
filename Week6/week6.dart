import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "프로토타입의 야무진 6주차 과제"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String apikey = "f0743d2f38c84aebeacefd9df13889aa";
  String cityName = "kor";
  String apiCall = "";
  Response? response;

  @override
  void initState() {
    super.initState();
    apiCall =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey";
  }

  Future<void> fetchData() async {
    try {
      response = await Dio().get(apiCall);
      setState(() {});
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 제목 가운데 정렬
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: <Widget>[
          ElevatedButton(
              onPressed: fetchData, // fetchData 함수 호출
              child: Text('날씨 API 받기!!!')),
          Text("기온 : ${response?.data['main']['temp'] ?? "No Data~"}"),
          Text("습도 : ${response?.data['main']['humidity'] ?? "No Data~"}"),
          Text("기압 : ${response?.data['main']['pressure'] ?? "No Data~"}"),
          Text("풍속 : ${response?.data['wind']['speed'] ?? "No Data~"}")
        ]),
      ),
    );
  }
}
