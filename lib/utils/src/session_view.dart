part of session;

class Session extends StatefulWidget {

  const Session({
    this.guest = false,
    required this.builder,
  });

  @override
  State<StatefulWidget> createState() {
    return _SessionState();
  }

  final bool guest;

  final Future Function(BuildContext context) builder;
}

class _SessionState extends State<Session> {

  Widget? _child;

  bool _isLogged = false;

  @override
  void initState() {
    _checkSession();
    super.initState();
  }

  void _checkSession() async {
    SessionUtils session = await SessionUtils.initSession();

    bool pIsLogged = false;

    /* SESSION CHECK */

    /* Jika terdapat session dan bukan halaman guest maka login valid */
    if(session.userid != null
      && session.fullname != null) {

      /* Jika bukan guest maka tampil halaman yang di request */
      if(!widget.guest)
        pIsLogged = true;

      /* Jika guest maka redirect ke halaman awal terlebih dahulu */
      else
        Routes.redirect(context, HomeRoute.home);
    }

    /* Jika halaman guest maka login valid dan akan diarahkan ke halaman yg direquest */
    else if(widget.guest) {
      pIsLogged = true;
    }

    /* Jika selain 2 kondisi diatas maka login tidak valid dan diarahkan ke halaman login*/
    else {
      SessionUtils.removeSession().then((value) {
        Routes.redirect(context, LoginRoute.login);
      });
    }

    _child = await widget.builder(context);

    setState(() {
      _isLogged = pIsLogged;
    });
  }


  @override
  Widget build(BuildContext context) {
    return _child == null ? SessionSplashScreen()
        : _isLogged ? _child! : PageNotFoundView();
  }
}