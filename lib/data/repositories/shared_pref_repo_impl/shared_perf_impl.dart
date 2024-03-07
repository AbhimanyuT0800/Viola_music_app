import 'package:music_app/domain/repositories/shared_pref_repo/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefImpl {
  static late final SharedPreferences pref;

  SharedPrefImpl._create(SharedPreferences preferences) {
    pref = preferences;
  }
  // method for calling private constractor and create an instance for sharedpref
  static create() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return SharedPrefImpl._create(pref);
  }

// set sharepref status

  static void setSharedpref({required bool status}) {
    pref.setBool('status', status);
  }

// get shared pref status

  static bool getSharedPref() {
    return pref.getBool('status') ?? false;
  }
}
