import 'package:animateds/pages/home_page.dart';
import 'package:animateds/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.HOME_PAGE,
    routes: {
      Routes.HOME_PAGE: (ctx) => HomePage(),
    },
  ));
  SystemChrome.setEnabledSystemUIOverlays([]);
}
