import 'package:shared_preferences/shared_preferences.dart';

createUserSharedPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.getBool('isLoggedIn') ?? prefs.setBool('isLoggedIn', false);
  prefs.getBool('isPolicyAcknowledged') ??
      prefs.setBool('isPolicyAcknowledged', false);
  prefs.setString('username', 'none');
  prefs.setString('std', 'none');
}
