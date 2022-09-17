import 'package:flutter/material.dart';

startWidget(widgetChild) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Attendance App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: widgetChild,
  );
}
