import 'package:bs_admin/constants/constants.dart';
import 'package:bs_admin/presenters/type_presenter.dart';
import 'package:bs_admin/routes.dart';
import 'package:bs_admin/routes/home_route.dart';
import 'package:bs_admin/routes/masters/type_route.dart';
import 'package:bs_admin/utils/styles.dart';
import 'package:bs_admin/utils/utils.dart';
import 'package:bs_admin/views/masters/types/source/datasource.dart';
import 'package:bs_admin/views/skins/widgets/breadcrumbs.dart';
import 'package:bs_admin/views/skins/wrapper.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

class TypeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TypeViewState();
  }
}

class _TypeViewState extends State<TypeView> implements ViewContract {

  late TypePresenter _presenter;

  @override
  void initState() {
    _presenter = TypePresenter(this);
    super.initState();
  }

  @override
  void updateState() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      menuKey: TypeRoute.routeKey,
      title: TypeText.title,
      subTitle: TypeText.subTitle,
      breadcrumbs: [
        Breadcrumbs(label: DBText.home, icon: Icons.home, onPressed: () =>
            Routes.redirect(context, HomeRoute.home)),
        Breadcrumbs(label: DBText.master),
        Breadcrumbs(label: TypeText.title),
      ],
      child: Container(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Column(
          children: [
            BsCard(
              style: Styles.boxCard,
              children: [
                BsCardContainer(title: Text(DBText.masterTitle(TypeText.title)), actions: [
                  BsButton(
                    label: Text(DBText.buttonAdd),
                    prefixIcon: DBIcon.buttonAdd,
                    style: BsButtonStyle.primary,
                    onPressed: () => _presenter.add(context),
                  )
                ]),
                BsCardContainer(child: Column(
                  children: [
                    BsDatatable(
                      title: Text(DBText.dataTitle(TypeText.title)),
                      source: _presenter.typeSource,
                      columns: TypeDataSource.columns,
                      serverSide: (params) => _presenter.datatables(context, params),
                      pagination: BsPagination.simplyButtons,
                    )
                  ],
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}