import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class PageNotFoundView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _PageNotFoundViewState();
  }
}

class _PageNotFoundViewState extends State<PageNotFoundView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('404',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  )
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                child: Text('Maaf halaman tidak ditemukan',
                  style: TextStyle(
                    fontSize: 16.0,
                  )
                ),
              ),
              BsButton(
                label: Text('Kembali ke halaman sebelumnya'),
                style: BsButtonStyle.primary,
                prefixIcon: Icons.chevron_left_outlined,
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}