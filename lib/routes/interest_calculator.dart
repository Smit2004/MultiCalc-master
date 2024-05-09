import 'package:flutter/material.dart';

class InterestCalculatorScreen extends StatefulWidget {
  @override
  _InterestCalculatorScreenState createState() =>
      _InterestCalculatorScreenState();
}

class _InterestCalculatorScreenState extends State<InterestCalculatorScreen> {
  String _principal = '';
  String _rate = '';
  String _time = '';
  String _result = '0'; // Initial text set to "0"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interest Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Interest: $_result',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Principal'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _principal = value;
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Rate (%)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _rate = value;
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Time (years)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _time = value;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateInterest,
              child: Text('Calculate Interest'),
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

  void _calculateInterest() {
    double principal = double.tryParse(_principal) ?? 0;
    double rate = double.tryParse(_rate) ?? 0;
    double time = double.tryParse(_time) ?? 0;

    if (principal > 0 && rate > 0 && time > 0) {
      double interest = (principal * rate * time) / 100;
      setState(() {
        _result = interest.toStringAsFixed(2); // Display interest with two decimal places
      });
    } else {
      setState(() {
        _result = '0'; // Reset result to "0" if inputs are invalid
      });
    }
  }

  void _clearFields() {
    setState(() {
      _principal = '';
      _rate = '';
      _time = '';
      _result = '0';
    });
  }
}
