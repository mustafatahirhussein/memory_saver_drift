import 'package:flutter/material.dart';
import 'package:memory_saver_drift/memorysaver.dart';
import 'package:memory_saver_drift/screens/memory_listing.dart';

MyDatabase? memoryDb;

void main() {
  memoryDb = MyDatabase();
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MemoryListing();
  }
}
