import 'package:attendant_tracking_web/provider/timezone.dart';
import 'package:attendant_tracking_web/testing.dart';
import 'package:flutter/material.dart';
import 'package:attendant_tracking_web/pages/register.dart';
import 'package:attendant_tracking_web/pages/login.dart';

void main() => runApp(
  MaterialApp(debugShowCheckedModeBanner: false, home: attendantApp()),
);

class attendantApp extends StatefulWidget {
  @override
  State<attendantApp> createState() => _attendantApp();
}

class _attendantApp extends State<attendantApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('ATTENDANT TRACKING'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontFamily: 'MomoTrustDisplay',
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.black, height: 5),
        ),
        elevation: 0,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Welcome user interface
            Image.asset('assets/attendant_app_logo_removebg_preview.png'),
            Text(
              textAlign: TextAlign.center,
              'Welcome to the Attendant App',
              style: TextStyle(fontSize: 25, fontFamily: 'MomoTrustDisplay'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                'Login',
                style: TextStyle(fontFamily: 'MomoTrustDisplay'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Register page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              child: Text(
                'Register',
                style: TextStyle(fontFamily: 'MomoTrustDisplay'),
              ),
            ),
          ],
        ),
      ),
      // dart
      // Add this property to your Scaffold in `lib/main.dart`
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
