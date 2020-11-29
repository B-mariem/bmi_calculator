import 'package:bmi_calculator/class/CalculatorBMI.dart';
import 'package:bmi_calculator/screens/CalculPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';

import '../constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage box = GetStorage();
    String age = box.read('age').toString();

    var arg = Get.arguments;
    print(arg);
    var result = CalculatorBMI().getResult(num.parse(arg));
    var interpretation = CalculatorBMI().getInterpretation(num.parse(arg));
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Expanded(
                child: Column(
                  children: [
                    myText('Your Result', mTitleStyle),
                    myText("your age : " + age, mBodyStyle),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: GestureDetector(
                  child: Container(
                decoration: BoxDecoration(
                    color: mActiveCardColor,
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.all(15.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      myText(
                        result,
                        TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: weightColor[result]),
                      ),
                      myText(arg, mBMIStyle),
                      myText(interpretation, mBodyStyle)
                    ]),
              ))),
          GestureDetector(
              onTap: () {
                Get.to(CalculPage());
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RE CALCULATE',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                height: 80.0,
                margin: EdgeInsets.only(top: 10.0),
                color: Color(0xFFEB1555),
              ))
        ],
      ),
    );
  }

  myText(String text, TextStyle myStyle) {
    return Text(
      text,
      style: myStyle,
      textAlign: TextAlign.center,
    );
  }
}
