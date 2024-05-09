import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  String _weightInput = '';
  String _heightInput = '';
  String _result = '0'; // Initial text set to "0"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'BMI: $_result',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _weightInput = value;
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Height (m)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _heightInput = value;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _clearFields,
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateBMI() {
    double weight = double.tryParse(_weightInput) ?? 0;
    double height = double.tryParse(_heightInput) ?? 0;

    if (weight > 0 && height > 0) {
      double bmi = weight / (height * height);
      setState(() {
        _result = bmi.toStringAsFixed(1); // Display BMI with one decimal place
      });
    } else {
      setState(() {
        _result = '0'; // Reset result to "0" if inputs are invalid
      });
    }
  }

  void _clearFields() {
    setState(() {
      _weightInput = '';
      _heightInput = '';
      _result = '0';
    });
  }
}
