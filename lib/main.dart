
import 'package:bmi_calculator/screens/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'screens/CalculPage.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    initialRoute: '/CalculPage',
   theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),),
    defaultTransition: Transition.zoom,
    //translations: MyTranslations(),
    //locale: Locale('fr'),
    locale : Get.deviceLocale ,
    fallbackLocale: Locale('fr'),
    getPages: [GetPage(name: '/CalculPage', page: ()=> CalculPage()),
    GetPage(name:'/ResultPage',page: ()=>ResultPage())
    ],));
    
}

