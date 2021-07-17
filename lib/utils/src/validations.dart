part of utils;

class UtilsValidation {

  static BsInputValidator inputRequired(String field) {
    return BsInputValidator(
      validator: (value) {
        String valueValidate = value.toString().trim();
        if (valueValidate.isEmpty || value == null)
          return '$field tidak boleh kosong';

        return null;
      }
    );
  }

  static BsSelectValidator selectRequired(String field) {
    return BsSelectValidator(
        validator: (value) {
          String valueValidate = value.toString().trim();
          if (valueValidate.isEmpty || value == null)
            return '$field tidak boleh kosong';

          return null;
        }
    );
  }
}