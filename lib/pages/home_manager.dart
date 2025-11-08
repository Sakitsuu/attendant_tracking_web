import 'package:attendant_tracking_web/pages/manage_employee.dart';
import 'package:flutter/material.dart';
import 'package:attendant_tracking_web/provider/timezone.dart';
import 'dart:async';

class HomeManager extends StatefulWidget {
  @override
  State<HomeManager> createState() => _HomeManagerState();
}

class _HomeManagerState extends State<HomeManager> {
  String time = "Loading...";
  DateTime? currentTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    fetchTime();
  }

  Future<void> fetchTime() async {
    final data = await TimezoneProvider.getTime('Asia/Phnom_Penh');
    if (data != null && data['dateTime'] != null) {
      setState(() {
        currentTime = DateTime.parse(data['dateTime']);
        time = _formatTime(currentTime!);
      });

      // Start updating locally every second
      timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {
          currentTime = currentTime!.add(const Duration(seconds: 1));
          time = _formatTime(currentTime!);
        });
      });
    } else {
      setState(() {
        time = "Failed to load time.";
      });
    }
  }

  String _formatTime(DateTime now) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(now.hour)}:${twoDigits(now.minute)}:${twoDigits(now.second)}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(
          'Home Page',
          style: TextStyle(fontFamily: 'MomoTrustDisplay', color: Colors.black),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(color: Colors.black, height: 5),
        ),
        elevation: 0,
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/attendant_app_logo_removebg_preview.png'),
                  SizedBox(height: 20),
                  Text(
                    'Manager Home Page',
                    style: TextStyle(
                      fontFamily: 'MomoTrustDisplay',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: VerticalDivider(color: Colors.black, thickness: 4)),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.green[300],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Current Time:',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'MomoTrustDisplay',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MomoTrustDisplay',
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      'Manager View',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'MomoTrustDisplay',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ManageEmployee(),
                        ),
                      );
                    },
                    child: const Text('Manage Employees'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
