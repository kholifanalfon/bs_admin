import 'package:bs_admin/views/components/dashboard_panel.dart';
import 'package:bs_admin/views/skins/widgets/breadcrumbs.dart';
import 'package:bs_admin/views/skins/wrapper.dart';
import 'package:bs_admin/views/utils/utils.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }

}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      title: 'Dashboard',
      subTitle: 'Selamat datang di halaman dashboard testing loresm ipsum saja test',
      breadcrumbs: [
        Breadcrumbs(label: 'Admin Page', icon: Icons.home, onPressed: () {}),
        Breadcrumbs(label: 'Dashboard'),
      ],
      child: Column(
        children: [
          BsRow(
            gutter: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
            children: [
              BsCol(
                sizes: ColScreen.inDevice(mobile: Col.col_12, tablet: Col.col_6, desktop: Col.col_3),
                child: DashboardPanel(
                  icon: Icons.info_outline_rounded,
                  value: '20 M',
                  title: 'Total Omzet'
                ),
              ),
              BsCol(
                sizes: ColScreen.inDevice(mobile: Col.col_12, tablet: Col.col_6, desktop: Col.col_3),
                child: DashboardPanel(
                  icon: Icons.info_outline_rounded,
                  value: '20 M',
                  title: 'Total Omzet'
                ),
              ),
              BsCol(
                sizes: ColScreen.inDevice(mobile: Col.col_12, tablet: Col.col_6, desktop: Col.col_3),
                child: DashboardPanel(
                  icon: Icons.info_outline_rounded,
                  value: '20 M',
                  title: 'Total Omzet'
                ),
              ),
              BsCol(
                sizes: ColScreen.inDevice(mobile: Col.col_12, tablet: Col.col_6, desktop: Col.col_3),
                child: DashboardPanel(
                  icon: Icons.info_outline_rounded,
                  value: '20 M',
                  title: 'Total Omzet'
                ),
              ),
              BsCol(
                sizes: ColScreen.all(Col.col_12),
                child: BsCard(
                  style: Utils.boxCard,
                  children: [
                    BsCardContainer(title: Text('Periode')),
                    BsCardContainer(child: Container())
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}