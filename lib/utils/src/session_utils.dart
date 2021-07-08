part of session;

class SessionCode {

  static const String userid = 'tNsjQ';
  static const String fullname = 'Cv6O1';
}

class SessionUtils {

  int? userid;
  String? fullname;

  SessionUtils({
    this.userid,
    this.fullname,
  });

  static Future<SessionUtils> initSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return SessionUtils(
      userid: prefs.getInt(SessionCode.userid),
      fullname: prefs.getString(SessionCode.fullname)
    );
  }

  static Future setSession(SessionUtils session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SessionCode.userid, session.userid!);
    prefs.setString(SessionCode.fullname, session.fullname!);
  }

  static Future removeSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SessionCode.userid);
    prefs.remove(SessionCode.fullname);
  }
}