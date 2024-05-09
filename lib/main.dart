import 'package:flutter/material.dart';
import 'routes/scientific_calculator.dart';
import 'routes/bmi_calculator.dart';
import 'routes/interest_calculator.dart';
import 'routes/currency_converter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/scientific': (context) => ScientificCalculatorScreen(),
        '/interest': (context) => InterestCalculatorScreen(),
        '/bmi': (context) => BMICalculatorScreen(),
        '/currency': (context) => CurrencyConverterScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          title: Text('Calculator App'),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 70.0, // Increased height of DrawerHeader
              child: DrawerHeader(
                child: Text(
                  'Calculators',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.calculate),
              title: Text('Scientific Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/scientific');
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('Interest Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/interest');
              },
            ),
            ListTile(
              leading: Icon(Icons.accessibility_new),
              title: Text('BMI Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/bmi');
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Currency Converter'),
              onTap: () {
                Navigator.pushNamed(context, '/currency');
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Calculator App!',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Text(
            'This app provides various calculators such as Scientific, Interest, BMI, and Currency Converter.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          // Cards with text
          Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              title: Text('Scientific Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/scientific');
              },
            ),
          ),
          Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              title: Text('Interest Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/interest');
              },
            ),
          ),
          Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              title: Text('BMI Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/bmi');
              },
            ),
          ),
          Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              title: Text('Currency Converter'),
              onTap: () {
                Navigator.pushNamed(context, '/currency');
              },
            ),
          ),
        ],
      ),
    );
  }
}
