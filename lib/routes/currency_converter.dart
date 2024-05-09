import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  String _amount = '';
  String _result = '0'; // Initial text set to "0"

  // List of currencies
  final List<String> _currencies = [
    'USD - US Dollar',
    'EUR - Euro',
    'JPY - Japanese Yen',
    'GBP - British Pound',
    'AUD - Australian Dollar',
    'CAD - Canadian Dollar',
    'CHF - Swiss Franc',
    'CNY - Chinese Yuan',
    'INR - Indian Rupee',
    'AED - Emirati Dirham',
  ];

  // Selected currencies
  String? _selectedFromCurrency = 'USD - US Dollar';
  String? _selectedToCurrency = 'EUR - Euro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Converted Amount: $_result',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(labelText: 'Enter Amount'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _amount = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    value: _selectedFromCurrency,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedFromCurrency = newValue;
                      });
                    },
                    items: _currencies.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                  ),
                  Icon(Icons.arrow_forward),
                  Container( // Wrap the "To" Dropdown with a Container
                    // margin: EdgeInsets.only(right: 300.0), // Add margin to the right side
                    child: DropdownButton<String>(
                      value: _selectedToCurrency,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedToCurrency = newValue;
                        });
                      },
                      items: _currencies.map((String currency) {
                        return DropdownMenuItem<String>(
                          value: currency,
                          child: Text(currency),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _convertCurrency,
                child: Text('Convert'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _clearFields,
                child: Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _convertCurrency() {
    double amount = double.tryParse(_amount) ?? 0;
    // Perform currency conversion calculation here
    // For demonstration purposes, let's just double the amount
    setState(() {
      _result = (amount * 83.34).toStringAsFixed(2); // Display result with two decimal places
    });
  }

  void _clearFields() {
    setState(() {
      _amount = '';
      _result = '0';
    });
  }
}
