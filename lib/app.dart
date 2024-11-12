import 'package:flutter/material.dart';
import 'package:practice/screen/expanded_listview.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpandedListView(),
    );
  }
}
