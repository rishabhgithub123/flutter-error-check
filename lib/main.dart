import 'package:error_handling/base_classes/base_client.dart';
import 'package:error_handling/base_classes/navigation_service.dart';
import 'package:error_handling/controller/base_controller.dart';
import 'package:error_handling/controller/test_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Error Handler',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Error Handler'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TestController controller = TestController();

  var response = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: NavigationService.navigatorKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(response)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //var data = await controller.fetchPost();
          controller.fetchData();
          // if(data != null) {
          //   setState(() {
          //     response = data;
          //   });
          // }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
