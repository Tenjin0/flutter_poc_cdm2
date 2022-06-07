import 'package:cdm_mobile2/controllers/cdm_url.dart';
import 'package:cdm_mobile2/controllers/informations.dart';
import 'package:cdm_mobile2/pages/home.dart';
import 'package:cdm_mobile2/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final CDMURLCtrl cdmUrlCtrl = Get.put(CDMURLCtrl());
    final InformationsCtrl informationsCtrl = Get.put(InformationsCtrl());
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/loading',
        routes: {
          '/loading': ((context) => const Loading()),
          '/home': ((context) => const Home())
        });
  }
}
