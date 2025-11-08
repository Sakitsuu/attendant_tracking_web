import 'package:flutter/material.dart';

class ManageEmployee extends StatefulWidget {
  @override
  State<ManageEmployee> createState() => _ManageEmployeeState();
}

class _ManageEmployeeState extends State<ManageEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text('Manage Employee'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25,
          fontFamily: 'MomoTrustDisplay',
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Employee List',
                style: TextStyle(fontSize: 24, fontFamily: 'MomoTrustDisplay'),
              ),
            ),
          ),
          Expanded(child: Divider(color: Colors.black, thickness: 2)),
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                'List of Employees will be shown here.',
                style: TextStyle(fontSize: 18, fontFamily: 'MomoTrustDisplay'),
              ),
            ),
          ),
          Expanded(child: Divider(color: Colors.black, thickness: 2)),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Add employee logic
                  },
                  child: Text('Add Employee'),
                ),
                SizedBox(width: 50),
                ElevatedButton(
                  onPressed: () {
                    // Remove employee logic
                  },
                  child: Text('Remove Employee'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
