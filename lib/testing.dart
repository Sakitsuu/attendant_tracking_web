import 'package:attendant_tracking_web/provider/timezone.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class TimeDisplayPage extends StatefulWidget {
  @override
  State<TimeDisplayPage> createState() => _TimeDisplayPageState();
}

class _TimeDisplayPageState extends State<TimeDisplayPage> {
  String time = "Fetching...";
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
        time = "Failed to fetch time.";
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
      appBar: AppBar(title: const Text('Live Phnom Penh Time')),
      body: Center(
        child: Text(
          time,
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
