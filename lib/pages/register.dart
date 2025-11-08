import 'package:attendant_tracking_web/pages/home_employee.dart';
import 'package:flutter/material.dart';
import 'package:attendant_tracking_web/main.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(
          'Register Page',
          style: TextStyle(fontFamily: 'MomoTrustDisplay', color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.black, height: 5),
        ),
        elevation: 0,
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset('assets/attendant_app_logo_removebg_preview.png'),
            // Registration form UI
            Text(
              'This is the Register Page',
              style: TextStyle(fontSize: 20, fontFamily: 'MomoTrustDisplay'),
            ),
            // Add registration field
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your username',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Confirm your password',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle registration
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeEmployee()),
                );
              },
              child: Text('Enter'),
            ),
            SizedBox(height: 10),
            Text('Status', style: TextStyle(fontFamily: 'MomoTrustDisplay')),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent, // or set a background color
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          'Developed by Try Chansak',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 14,
            fontFamily: 'MomoTrustDisplay',
          ),
        ),
      ),
    );
  }
}
