import 'package:music_app/domain/repositories/shared_pref_repo/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefImpl implements SharedPref {
  final Future<SharedPreferences> pref = SharedPreferences.getInstance();

  @override
  Future<void> setSharedpref({required bool status}) async {
    // pref = await SharedPreferences.getInstance();
    await (await pref).setBool('status', status);
  }

  @override
  Future<bool> getSharedPref() async {
    return (await pref).getBool('status')!;
  }
}
