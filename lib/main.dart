import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertest/noti.dart';
import 'notification.dart';

late final NotificationResponse notificationResponse;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  final String response = await rootBundle.loadString('assets/json/noti.json');
  notificationResponse =
      NotificationResponse.fromRawJson(response);

  notificationResponse.data?.forEach((element) {
    debugPrint("${element.toJson()}");
    debugPrint("____________________");
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const Noti(),
    );
  }
}