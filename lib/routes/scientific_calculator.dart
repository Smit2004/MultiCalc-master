import 'package:flutter/material.dart';

class ScientificCalculatorScreen extends StatefulWidget {
  @override
  _ScientificCalculatorScreenState createState() =>
      _ScientificCalculatorScreenState();
}

class _ScientificCalculatorScreenState
    extends State<ScientificCalculatorScreen> {
  String _input = '';
  String _result = '0'; // Initial text set to "0"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scientific Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _result,
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildButtonRow(['7', '8', '9', '/']),
                  buildButtonRow(['4', '5', '6', 'x']),
                  buildButtonRow(['1', '2', '3', '-']),
                  buildButtonRow(['0', '.', '=', '+']),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _input = '';
                      _result = '0'; // Reset result to "0"
                    });
                  },
                  child: Text('C'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('+/-'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('%'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buttons.map((label) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (label == '=') {
                      // Calculate result
                      _calculateResult();
                    } else {
                      // Append input
                      _input += label;
                      _result = _input;
                    }
                  });
                },
                child: Text(label),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void _calculateResult() {
    // Split input by operator
    List<String> parts = _input.split(RegExp(r'[+\-x/]'));
    double result = double.parse(parts[0]);

    // Iterate through operators and numbers
    for (int i = 1; i < parts.length; i++) {
      String operator = _input.replaceAll(RegExp(r'[0-9.]'), '').split('')[i - 1];
      double number = double.parse(parts[i]);
      switch (operator) {
        case '+':
          result += number;
          break;
        case '-':
          result -= number;
          break;
        case 'x':
          result *= number;
          break;
        case '/':
          result /= number;
          break;
      }
    }

    setState(() {
      _result = result.toString();
    });
  }
}
