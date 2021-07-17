part of datasource;

abstract class TypeFormSource {

  String typeid = '';
  late bool isLoading;

  BsSelectBoxController selectParent = BsSelectBoxController();

  TextEditingController inputCode = TextEditingController();
  TextEditingController inputName = TextEditingController();
  TextEditingController inputSequence = TextEditingController();
  TextEditingController inputDescription = TextEditingController();
}

class TypeForm {

  TypeForm({
    required this.context,
    required this.presenter
  });

  final BuildContext context;

  final TypePresenter presenter;

  Widget selectParent() {
    return BsFormGroup(
      label: Text(TypeText.formParent),
      child: BsSelectBox(
        searchable: true,
        disabled: presenter.isLoading,
        hintText: DBText.placeholderSelect(TypeText.formParent),
        selectBoxController: presenter.selectParent,
        serverSide: (params) => selectType(params, typeid: presenter.typeid),
        validators: [],
      ),
    );
  }

  Widget inputCode() {
    return BsFormGroup(
      label: Text(TypeText.formCode),
      child: BsInput(
        disabled: presenter.isLoading,
        controller: presenter.inputCode,
        hintText: DBText.placeholder(TypeText.formCode),
        validators: [
          UtilsValidation.inputRequired(TypeText.formCode),
        ],
      ),
    );
  }

  Widget inputName() {
    return BsFormGroup(
      label: Text(DBText.formName),
      child: BsInput(
        disabled: presenter.isLoading,
        controller: presenter.inputName,
        hintText: DBText.placeholder(DBText.formName),
        validators: [
          UtilsValidation.inputRequired(TypeText.formCode),
          BsInputValidators.maxLength(100),
        ],
      ),
    );
  }

  Widget inputSequence() {
    return BsFormGroup(
      label: Text(TypeText.formSequence),
      child: BsInput(
        disabled: presenter.isLoading,
        controller: presenter.inputSequence,
        hintText: DBText.placeholder(TypeText.formSequence),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly
        ],
        validators: [
          UtilsValidation.inputRequired(TypeText.formSequence)
        ],
      ),
    );
  }

  Widget inputDescription() {
    return BsFormGroup(
      label: Text(DBText.formDescription),
      child: BsInput(
        disabled: presenter.isLoading,
        controller: presenter.inputDescription,
        hintText: DBText.placeholder(DBText.formDescription),
        minLines: 5,
        maxLines: 5,
      ),
    );
  }
}