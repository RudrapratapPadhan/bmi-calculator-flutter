import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI calculator", style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text("Enter your weight in Kg"),
                    prefixIcon: Icon(Icons.line_weight_rounded),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text("Enter your height in feet"),
                    prefixIcon: Icon(Icons.height),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16),

                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter your height in Inch"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      int iInch = int.parse(inch);

                      var tInch = (iFt * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iWt / (tM * tM);

                      var msg = "";

                      if (bmi > 25) {
                        msg = "You are overweight";
                        bgColor = Colors.orange.shade200;

                      } else if (bmi < 18) {
                        msg = "You are underweight";
                        bgColor = Colors.red.shade200;

                      } else {
                        msg = "Your are healthy !!";
                        bgColor = Colors.green.shade200;
                      }

                      result = "$msg \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                      setState(() {
                        result;
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the required fields";
                      });
                    }
                  },
                  child: Text("Check",style: TextStyle(color: Colors.blue),),
                ),
                Text(result, style: TextStyle(fontSize: 25,fontWeight: FontWeight.w200)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
