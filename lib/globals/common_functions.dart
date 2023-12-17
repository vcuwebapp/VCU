import 'package:datetime_setting/datetime_setting.dart';
import 'package:flutter/material.dart';

checkAutoDateTime() async {
  bool autoDateTimeEnabled = true;
  try {
    bool timeAuto = await DatetimeSetting.timeIsAuto();
    bool timezoneAuto = await DatetimeSetting.timeZoneIsAuto();
    if (!timezoneAuto || !timeAuto) {
      autoDateTimeEnabled = false;
      await DatetimeSetting.openSetting();
    }
  } catch (e) {
    debugPrint('checkAutoDateTime error: $e');
  }
  return autoDateTimeEnabled;
}
