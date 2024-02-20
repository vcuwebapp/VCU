// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../globals/camera_view.dart';
import '../../globals/common_variables.dart';

class MarkAttendance extends StatefulWidget {
  const MarkAttendance({super.key});

  @override
  MarkAttendanceScreen createState() => MarkAttendanceScreen();
}

class MarkAttendanceScreen extends State<MarkAttendance> {
  int id = DateTime.now().microsecondsSinceEpoch;
  late String uuid;

  getStatus() {
    uuid = const Uuid().v1(options: {
      'node': [0x01, 0x23, 0x45, 0x67, 0x89, 0xab],
      'clockSeq': 0x1234,
      'mSecs': DateTime.now().microsecondsSinceEpoch,
      'nSecs': 5678,
    });

    captureAttendance(context);
  }

  @override
  void initState() {
    super.initState();
    getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mark Attendance'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Kindly wait...',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  captureAttendance(BuildContext context) async {
    //final Directory extDir = await getExternalStorageDirectory ();
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Camera(
          studentId: prefs.getString('studentId') ?? '1',
          disableCameraSwitch: true,
          selectedCameraIndex: 1,
          serverPath:
              'vcu/${prefs.getString("courseId")}_${prefs.getString('studentId')}/${DateTime.now().year}/',
        ),
      ),
    );
  }
}
