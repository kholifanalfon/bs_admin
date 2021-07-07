import 'package:bs_admin/routes.dart';
import 'package:bs_admin/routes/home_route.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginViewState();
  }
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: BreakPoint.isDesktop(context)
                  || BreakPoint.isTablet(context)? 400.0 : null,
              padding: EdgeInsets.fromLTRB(25.0, 70.0, 25.0, 30.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff12263f).withOpacity(0.1),
                      blurRadius: 24.0,
                      spreadRadius: 0.0,
                      offset: Offset(0.0, 12.0)
                    )
                  ],
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50.0),
                    child: Text('Masuk untuk ke Halaman Admin',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff575962)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 30.0),
                    child: BsInput(
                      controller: TextEditingController(),
                      hintTextLabel: 'Nama Pengguna',
                      style: BsInputStyle(
                        border: Border(bottom: BorderSide(color: Color(0xffebedf2)))
                      ),
                      size: BsInputSize(
                        fontSize: 14.0,
                        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
                        marginTop: 10.0,
                        marginLeft: 0.0,
                        transitionMarginTop: 10.0,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 50.0),
                    child: BsInput(
                      controller: TextEditingController(),
                      hintTextLabel: 'Kata Sandi',
                      style: BsInputStyle(
                        border: Border(bottom: BorderSide(color: Color(0xffebedf2)))
                      ),
                      size: BsInputSize(
                        fontSize: 14.0,
                        padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 14.0, bottom: 14.0),
                        marginTop: 10.0,
                        marginLeft: 0.0,
                        transitionMarginTop: 10.0,
                      ),
                      obscureText: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 50.0),
                    child: BsButton(
                      label: Text('Masuk'),
                      size: BsButtonSize(
                        fontSize: 16.0,
                        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                        spaceLabelIcon: 10.0
                      ),
                      style: BsButtonStyle(
                        color: Colors.white,
                        backgroundColor: BsColor.primary,
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                      ),
                      onPressed: () => Routes.redirect(context, HomeRoute.home),
                    ),
                  ),
                  Container(
                    child: Text('Copyright 2021 Admin Template',
                      style: TextStyle(
                        color: Color(0xff575962),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w100
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}