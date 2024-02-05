

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _heightSliderValue = 170;
  double _weightSliderValue = 80;
  int _bmi = 0;
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"), backgroundColor: Colors.red,),
      body: Column(
        children: [
          Text("BMI Calculator", style: TextStyle(color: Colors.red, fontSize: 32),),
          Text("We care about your health", style: TextStyle(fontSize: 24),),
          Image.network("https://www.cdc.gov/healthyweight/images/assessing/bmi-adult-fb-600x315.jpg"),
          Text("Height : (${_heightSliderValue.round()} cm) ", style: TextStyle(fontSize: 20),),
          Slider(
            value: _heightSliderValue,
            max: 220,
            onChanged: (double value) {
              setState(() {
                _heightSliderValue = value;
              });
            },
          ),
          Text("Width: (${_weightSliderValue.round()} kg)", style: TextStyle(fontSize: 20),),
          Slider(
            value: _weightSliderValue,
            max: 200,
            onChanged: (double value) {
              setState(() {
                _weightSliderValue = value;
              });
            },
          ),
          Text("Your BMI is $_bmi"),
          Text(_message),

          TextButton.icon(onPressed: (){

            // weight (kg)  / (height (m))^2;
            var bmiTemp =  _weightSliderValue / pow((_heightSliderValue/100), 2);
            print(bmiTemp);
            // ASSIGNING bmiTemp into _bmi
            // _bmi = bmiTemp.round();

            //ASSIGN bmiTemp into _bmi
            // Refresh the part of UI that has _bmi and show the updated value

            var messageTemp  = "";
            if (bmiTemp < 18.5){
              messageTemp =  "You are underweight";
            }
            else if (bmiTemp < 25){
              messageTemp = "You are normal";
            }
            else if (bmiTemp < 30){
              messageTemp = "You are overweight";
            }
            else if (bmiTemp < 25){
              messageTemp = "You are obese";
            }
            else {
              messageTemp = "You are extremely obese";
            }
            setState(() {
              _bmi = bmiTemp.round();
              _message =  messageTemp;
            });
          },
              icon: Icon(Icons.favorite), label: Text("Calculate BMI"))

        ],
      ),
    );
  }
}

