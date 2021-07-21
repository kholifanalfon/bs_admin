import 'package:bs_admin/constants/constants.dart';
import 'package:bs_admin/presenters/login_presenter.dart';
import 'package:bs_admin/utils/utils.dart';
import 'package:bs_admin/views/login/source/datasource.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _LoginViewState();
  }
}

class _LoginViewState extends State<LoginView> implements LoginPresenterContract {

  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  late LoginPresenter _presenter;

  @override
  void initState() {
    _presenter = LoginPresenter(this);
    super.initState();
  }

  @override
  void updateState() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formState,
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
                      margin: EdgeInsets.only(bottom: 25.0),
                      child: Text('Masuk untuk ke Halaman Admin',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff575962)
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(children: [Expanded(child: Container(
                      margin: EdgeInsets.only(bottom: 25.0),
                      child: _presenter.errorMessage == null ? Container() : Container(
                        padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Text(_presenter.errorMessage!,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ))]),
                    Container(
                      margin: EdgeInsets.only(bottom: 30.0),
                      child: BsInput(
                        disabled: _presenter.isLoading,
                        controller: _presenter.inputUsername,
                        hintTextLabel: LoginText.formUsername,
                        style: BsInputStyle(
                            border: Border(bottom: BorderSide(color: Color(0xffebedf2)))
                        ),
                        size: BsInputSize.outlineBottomMd,
                        validators: [
                          UtilsValidation.inputRequired('Nama pengguna'),
                          BsInputValidators.maxLength(50),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 50.0),
                      child: BsInput(
                        disabled: _presenter.isLoading,
                        controller: _presenter.inputPassword,
                        hintTextLabel: LoginText.formPassword,
                        style: BsInputStyle(
                          border: Border(bottom: BorderSide(color: Color(0xffebedf2)))
                        ),
                        size: BsInputSize.outlineBottomMd,
                        obscureText: true,
                        validators: [
                          UtilsValidation.inputRequired('Kata sandi'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 50.0),
                      child: BsButton(
                        disabled: _presenter.isLoading,
                        label: Text(_presenter.isLoading ? DBText.buttonProcessing : LoginText.buttonLogin),
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
                        onPressed: () {
                          if(_formState.currentState!.validate() && !_presenter.isLoading)
                            _presenter.login(context);
                        },
                      ),
                    ),
                    Container(
                      child: Text(LoginText.footerCopyright,
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
      ),
    );
  }
}