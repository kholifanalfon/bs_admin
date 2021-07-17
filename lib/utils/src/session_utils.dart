part of session;

class SessionCode {

  static const String userid = 'tNsjQ';
  static const String fullname = 'Cv6O1';
  static const String token = 'sBN13s';
}

class SessionUtils {

  int? userid;
  String? fullname;
  String? token;

  SessionUtils({
    this.userid,
    this.fullname,
    this.token,
  });

  static Future<SessionUtils> initSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return SessionUtils(
      userid: prefs.getInt(SessionCode.userid),
      fullname: prefs.getString(SessionCode.fullname),
      token: prefs.getString(SessionCode.token),
    );
  }

  static Future get(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(code);
  }

  static Future setSession(SessionUtils session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SessionCode.userid, session.userid!);
    prefs.setString(SessionCode.fullname, session.fullname!);
    prefs.setString(SessionCode.token, session.token!);
  }

  static Future removeSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SessionCode.userid);
    prefs.remove(SessionCode.fullname);
    prefs.remove(SessionCode.token);
  }
}