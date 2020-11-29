import 'package:flutter/material.dart';

const mActiveCardColor = Color(0xff1D1F33);
const mInactiveCardColor = Color(0xff111328);
const mBottomContainerColor = Color(0xffEA1556);
const mBottomContainerHeight = 80.0;

const mLabelStyle = TextStyle(
  fontSize: 18,
  color: Color(0xff8d8e98),
  
);

const mNumberStyle = TextStyle(
 fontWeight: FontWeight.w900, fontSize: 38
);

const mLargeButtonStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold
);

const mTitleStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold
);

const mResultStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  color: Color(0xff24d876)
);

const mBMIStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold
);

const mBodyStyle = TextStyle(
  fontSize: 22.0,
);

const Map<String,Color> weightColor = {
  "Underweight" : Color(0xff33B1E4),
  "Normal" : Color(0xff94C947),
  "Overweight" : Color(0xffF99929),
  "Obesity" : Color(0xffC92C33)
};