import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencesHelper{
  static String userIdKey = 'USERKEY';
  static String userNameKey ='USERNAMEKEY';
  static String userEmailKey = 'USEREMAILKEY';
  static String userPickKey = ' USERPICKEY';
  static String displayNameKey = 'USERDISPLAYNAME';


  Future<bool> saveUserId(String getUserId)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey,getUserId);
  }

  Future<bool> saveUserEmail(String getUserEmail)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey,getUserEmail);
  }

  Future<bool> saveUserName(String getUserName)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey,getUserName);
  }

  Future<bool> saveUserPic(String getUserPic)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userPickKey,getUserPic);
  }

  Future<bool> saveUserDisplayName(String getUserDisplayName)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(displayNameKey,getUserDisplayName);
  }
}