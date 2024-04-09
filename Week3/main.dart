import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
        useMaterial3: true
      ),
      home: const MyHomePage(title: "Week3")
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true, // 제목 가운데 정렬
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: Column(
          children: [
            const Text("과제", style: TextStyle(fontSize: 20)),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white, // 박스 색상
                        borderRadius: BorderRadius.circular(10), // 테두리 모서리 반경
                        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1), // 테두리 스타일
                    ),
                    margin: const EdgeInsets.all(10),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("오늘의 과제"),
                          Icon(Icons.book)
                        ]
                    )
                ),
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white, // 박스 색상
                      borderRadius: BorderRadius.circular(10), // 테두리 모서리 반경
                      border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1), // 테두리 스타일
                    ),
                    margin: const EdgeInsets.all(10),
                    child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("수행한 과제"),
                          Icon(Icons.collections_bookmark)
                        ]
                    )
                )
              ]
            ),
            const Text("나의 수행도", style: TextStyle(fontSize: 20)),
            Container(
              width:350,
              height:350,
                decoration: BoxDecoration(
                  color: Colors.white, // 박스 색상
                  borderRadius: BorderRadius.circular(10), // 테두리 모서리 반경
                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1), // 테두리 스타일
                ),
              child: TableCalendar(
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2024, 12, 31),
                focusedDay: DateTime.now(),
              )
            ),

            const Text("나의 다짐", style: TextStyle(fontSize: 20)),
            const Text("우릴 과제와 시험에 가두지 마~ 자유로워 지금")
          ]
        )
        )
    );
  }
}