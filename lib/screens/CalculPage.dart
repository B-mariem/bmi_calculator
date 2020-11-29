import 'package:bmi_calculator/class/CalculatorBMI.dart';
import 'package:bmi_calculator/screens/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'package:get_storage/get_storage.dart';

class CalculPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CalculPageView(),
    );
  }
}

enum Gender { Male, Female }
Gender gender;
int height = 180;
int weight = 50;
int age = 18;

class CalculPageView extends StatefulWidget {
  CalculPageView({Key key}) : super(key: key);

  @override
  _CalculPageViewState createState() => _CalculPageViewState();
}

class _CalculPageViewState extends State<CalculPageView> {
  //final TextEditingController namecontroller = TextEditingController();

  GetStorage box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          //section : name

          //section 1 : Gender
          Expanded(
            child: Row(
              children: [
                Expanded(
                    //card male_gender
                    //myCard (widget,[function])
                    //myCardGender(label,iconname)
                    child: myCard(
                  myCardGender("MALE", FontAwesomeIcons.mars),
                  () {
                    setState(() {
                      gender = Gender.Male;
                    });
                  },
                )),
                //card male_female
                //myCard (widget,[function])
                //myCardGender(label,iconname)
                Expanded(
                    child: myCard(
                  myCardGender("FEMALE", FontAwesomeIcons.venus),
                  () {
                    setState(() {
                      gender = Gender.Female;
                    });
                  },
                )),
              ],
            ),
          ),
          //section 2 : Height
          //card height
          //myCard (widget,[function])
          //heightCard()
          Expanded(child: myCard(heightCard())),

          //section 3 : Age+weight
          Expanded(
            child: Row(
              children: <Widget>[
                //card weight
                //myCard (widget,[function])
                //weightCard()

                Expanded(child: myCard(weightCard())),
                //card Age
                //myCard (widget,[function])
                //ageCard()
                Expanded(child: myCard(ageCard())),
              ],
            ),
          ),

          // section 4 : CALCULATE
          GestureDetector(
              onTap: () {
                print(gender);
                box.write("age", age);
                CalculatorBMI calc =
                    CalculatorBMI(height: height, weight: weight);
                Get.to(ResultPage(), arguments: calc.getBMI());
              },
              child: Container(
                child: Center(
                    child: myText('CALCULATE',
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
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

  myCard(Widget cardChild, [Function onpressed]) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Color(0xFF1d1e33),
            borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }

  myCardGender(String lable, IconData iconname) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconname,
          size: 70,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          lable,
          style: TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0),
        )
      ],
    );
  }

  heightCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myText('HEIGHT', mLabelStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            myText(height.toString(), mNumberStyle),
            myText('cm', mLabelStyle),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
              thumbColor: Color(0xFFEB1555),
              overlayColor: Color(0x29EB1555),
              activeTrackColor: Colors.white,
              inactiveTrackColor: Color(0xFF8D8E98),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
          child: Slider(
              min: 130,
              max: 250,
              value: height.toDouble(),
              onChanged: (double value) {
                setState(() {
                  height = value.round();
                });
              }),
        )
      ],
    );
  }

//age Card
  ageCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myText('AGE', mLabelStyle),
        myText(age.toString(), mNumberStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            radisButton(FontAwesomeIcons.minus, () {
              setState(() {
                age--;
              });
            }),
            SizedBox(
              width: 10,
            ),
            radisButton(FontAwesomeIcons.plus, () {
              setState(() {
                age++;
              });
            }),
          ],
        )
      ],
    );
  }
//weight Card
  weightCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myText('WEIGHT', TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0)),
        myText(weight.toString(), mNumberStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            radisButton(FontAwesomeIcons.minus, () {
              setState(() {
                weight--;
              });
            }),
            SizedBox(
              width: 10,
            ),
            radisButton(FontAwesomeIcons.plus, () {
              setState(() {
                weight++;
              });
            }),
          ],
        )
      ],
    );
  }
//circle button
  radisButton(IconData iconname, Function onPressed) {
    return RawMaterialButton(
      child: Icon(
        iconname,
        size: 30,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: Color(0xFFEB1555),
      constraints: BoxConstraints.tightFor(width: 45.0, height: 45.0),
    );
  }
}