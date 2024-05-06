import 'package:bmi/youTubePlayerPage.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI HEALTH',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        hintColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.grey[200],
        fontFamily: 'Roboto',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String bmiResult = '';
  var msg="";
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI HEALTH'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: weightController,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  prefixIcon: Icon(Icons.monitor_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: heightController,
                decoration: const InputDecoration(
                  labelText: 'Height (cm)',
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _calculateBMI();
                },
                child: const Text('Calculate BMI'),
              ),
              const SizedBox(height: 20),
              Text(
                'Your are : $msg \n  Your  BMI is : $bmiResult ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: bgColor, // Apply background color here
      bottomNavigationBar: Container( // Move footer here
        color: Colors.deepPurple,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Design by Techerrornr',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Developed by Techerrornr',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SocialMediaPage(
                      //videoUrl: '',
                    ),
                  ),
                );
              },
              child: const Text('Follow Me on Social Media Page'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    double bmi = weight / ((height / 100) * (height / 100));
    setState(() {
      bmiResult = bmi.toStringAsFixed(2);
      if (bmi > 25) {
        bgColor = Colors.red;
        msg=" over weight ";

      } else if (bmi < 18.5) {
        bgColor = Colors.blue;
        msg=" under weight ";
      } else {
        bgColor = Colors.green;
        msg=" Fit";
      }
    });
  }
}
