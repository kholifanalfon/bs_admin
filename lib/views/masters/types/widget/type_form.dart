import 'package:bs_admin/constants/constants.dart';
import 'package:bs_admin/presenters/type_presenter.dart';
import 'package:bs_admin/views/masters/types/source/datasource.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/cupertino.dart';

class TypeFormModal extends StatefulWidget {

  const TypeFormModal({
    Key? key,
    required this.presenter,
    this.onClose,
    this.onSubmit
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TypeFormModalState();
  }

  final TypePresenter presenter;

  final VoidCallback? onClose;

  final VoidCallback? onSubmit;

}

class _TypeFormModalState extends State<TypeFormModal> {

  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  late TypeForm _typeForm;

  @override
  void initState() {
    _typeForm = TypeForm(
      context: context,
      presenter: widget.presenter,
    );
    super.initState();
  }

  void updateState() {
    if(mounted)
      setState(() {
      });
  }

  @override
  Widget build(BuildContext context) {
    return BsModal(
        context: context,
        dialog: BsModalDialog(
          child: Form(
            key: _formState,
            child: BsModalContent(
              children: [
                BsModalContainer(title: Text(DBText.formTitle(TypeText.title)), closeButton: true),
                BsModalContainer(
                  child: Column(
                    children: [
                      _typeForm.selectParent(),
                      _typeForm.inputCode(),
                      _typeForm.inputName(),
                      _typeForm.inputSequence(),
                      _typeForm.inputDescription()
                    ],
                  ),
                ),
                BsModalContainer(
                    mainAxisAlignment: MainAxisAlignment.end,
                    actions: [
                      BsButton(
                        disabled: widget.presenter.isLoading,
                        margin: EdgeInsets.only(right: 5.0),
                        label: Text(DBText.buttonModalCancel),
                        prefixIcon: DBIcon.buttonModalCancel,
                        style: BsButtonStyle.danger,
                        size: BsButtonSize.btnMd,
                        onPressed: () {
                          Navigator.pop(context);
                          if(widget.onClose != null)
                            widget.onClose!();
                        },
                      ),
                      BsButton(
                        disabled: widget.presenter.isLoading,
                        label: Text(widget.presenter.isLoading ? DBText.buttonProcessing : DBText.buttonModalSave),
                        prefixIcon: DBIcon.buttonModalSave,
                        style: BsButtonStyle.primary,
                        size: BsButtonSize.btnMd,
                        onPressed: () {
                          if(widget.onSubmit != null)
                            widget.onSubmit!();
                        },
                      ),
                    ]
                )
              ],
            ),
          ),
        )
    );
  }

}