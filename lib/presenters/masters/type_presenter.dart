import 'package:bs_admin/helpers/helpers.dart';
import 'package:bs_admin/models/masters/type_model.dart';
import 'package:bs_admin/services/masters/type_service.dart';
import 'package:bs_admin/utils/utils.dart';
import 'package:bs_admin/views/components/dialog_confirm.dart';
import 'package:bs_admin/views/masters/types/source/datasource.dart';
import 'package:bs_admin/views/masters/types/widget/type_form.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

abstract class TypePresenterContract implements ViewContract {}

class TypePresenter extends TypeFormSource {

  GlobalKey<State> _formState = GlobalKey<State>();

  final TypePresenterContract viewContract;

  TypePresenter(this.viewContract);

  TypeService typeService = TypeService();
  TypeModel typeModel = TypeModel();

  TypeDataSource typeSource = TypeDataSource();

  void setLoading(bool loading) {
    isLoading = loading;
    viewContract.updateState();

    if(_formState.currentState != null)
      _formState.currentState!.setState(() {
      });
  }

  Map<String, String> getDatas() {
    return {
      'parentid': selectParent.getSelectedAsString() != '' ? selectParent.getSelectedAsString() : '0',
      'typecd': inputCode.text,
      'typenm': inputName.text,
      'typeseq': inputSequence.text,
      'description': inputDescription.text,
    };
  }

  void setData(TypeModel type) {
    typeModel = type;

    if(typeModel.parentid != 0)
      selectParent.setSelected(BsSelectBoxOption(value: typeModel.parentid, text: Text(parseString(typeModel.parent.typenm))));

    typeid = parseString(typeModel.id);
    inputCode.text = parseString(typeModel.typecd);
    inputName.text = parseString(typeModel.typenm);
    inputSequence.text = parseString(typeModel.typeseq);
    inputDescription.text = parseString(typeModel.description);

    setLoading(false);
  }

  void resetData() {
    typeid = '';
    selectParent.clear();
    inputCode.clear();
    inputName.clear();
    inputSequence.clear();
    inputDescription.clear();
  }

  Future datatables(BuildContext context, Map<String, String> params) async {
    try {
      return await typeService.datatables(params).then((value) {
        if(value.result!) {
          typeSource.response = BsDatatableResponse.createFromJson(value.data);
          typeSource.onEditListener = (typeid) => edit(context, typeid);
          typeSource.onDeleteListener = (typeid) => delete(context, typeid);
          setLoading(false);
        } else setLoading(false);
      });
    } catch (e) {setLoading(false);}
  }

  void add(BuildContext context) {
    resetData();
    setLoading(false);

    showDialog(
      context: context,
      builder: (context) => TypeFormModal(
        key: _formState,
        presenter: this,
        onSubmit: () => store(context),
      )
    );
  }

  void store(BuildContext context) {
    setLoading(true);
    typeService.store(getDatas()).then((res) {
      setLoading(false);

      if(res.result!) {
        Navigator.pop(context);
        typeSource.controller.reload();
      }
    });
  }

  void edit(BuildContext context, int id) {
    resetData();
    setLoading(true);

    showDialog(
      context: context,
      builder: (context) => TypeFormModal(
        key: _formState,
        presenter: this,
        onSubmit: () => update(context, id),
      ),
    );

    typeService.show(id).then((res) {
      if(res.result!) {
        setData(TypeModel.fromJson(res.data));
      }
    });
  }

  void update(BuildContext context, int id) {
    setLoading(true);
    typeService.update(id, getDatas()).then((res) {
      setLoading(false);

      if(res.result!) {
        Navigator.pop(context);
        typeSource.controller.reload();
      }
    });
  }

  void delete(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (context) => DialogConfirm(
        onPressed: (value) {
          if(value == DialogConfirmOption.YES_OPTION) {
            typeService.delete(id).then((res) {
              setLoading(false);
              Navigator.pop(context);
              typeSource.controller.reload();
            });
          }
        },
      )
    );
  }

}