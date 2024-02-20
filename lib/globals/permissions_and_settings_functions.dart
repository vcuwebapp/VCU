import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:datetime_setting/datetime_setting.dart';
import 'package:device_information/device_information.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app_files_functions.dart';
import 'common_variables.dart';
import 'common_widgets.dart';

///Checks if the android version is less than 13 or not.
Future<bool> isAndroidVersionLessThan13() async {
  int sdkVersion = await DeviceInformation.apiLevel;
  return sdkVersion < 30; // Android 13 SDK version is 30
}

///Requests teh permissions required by the app.
getPermissions() async {
  await createFolder();
  await Permission.notification.request();
}

///Checks if the requested permissions are granted or not.
///If not, then requests the permission else proceeds furthers.
checkPermissions(Permission requestedPermission) async {
  bool permissionGranted = false;
  if (await requestedPermission.isGranted) {
    permissionGranted = true;
  } else {
    await requestedPermission.request().then((value) {
      if (value.isGranted) {
        permissionGranted = true;
      }
    });
  }
  return permissionGranted;
}

///Calls lookup function which pings google.com.
///If the response is received in 2 seconds, it implies that the device has string internet connection.
///If only the device has strong internet connection the connectivity is true else it is false.
///Note: This is to avoid sending data in low network conditions to avoid any kind of data loss.
checkConnectivity() async {
  bool connectivity = false;
  try {
    final result = await InternetAddress.lookup('google.com')
        .timeout(const Duration(seconds: 5));
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connectivity = true;
    }
  } on SocketException {
    connectivity = false;
  }
  return connectivity;
}

///Converts UTC time to Local time.
String convertServerDatetime(String datetime, int ctzoffset) {
  try {
    DateTime date = DateTime.parse(datetime);
    DateTime localdate = date.add(Duration(minutes: ctzoffset));
    return fdt.format(localdate);
  } catch (e) {
    return '(Not Available)';
  }
}

///Checks if the auto date time settings are on in user's device. So that user does not make changes manually to trick the system.
///Note: This is to restrict the user to perform the work in given time.
checkAutoDatetime() async {
  bool autoDateTime = await DatetimeSetting.timeIsAuto();
  bool autoTimezone = await DatetimeSetting.timeZoneIsAuto();
  bool falseDate = autoDateTime && autoTimezone;
  if (!falseDate) {
    showFlutterToastMsg('Enable auto date & time to proceed', kRedColor);
    await AppSettings.openAppSettings();
  }
  return autoDateTime;
}
