import 'package:bs_admin/constants/constants.dart';
import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/cupertino.dart';

enum DialogConfirmOption { YES_OPTION, NO_OPTION }

class DialogConfirm extends StatelessWidget {

  const DialogConfirm({
    this.title = 'Konfirmasi Hapus',
    this.message = 'Apakah anda yakin?',
    this.disabled = false,
    required this.onPressed,
  });

  final String title;

  final String message;

  final bool disabled;

  final ValueChanged<DialogConfirmOption> onPressed;

  @override
  Widget build(BuildContext context) {
    return BsModal(
      context: context,
      dialog: BsModalDialog(
        size: BsModalSize.sm,
        mainAxisAlignment: MainAxisAlignment.center,
        child: BsModalContent(
          children: [
            BsModalContainer(title: Text(title), closeButton: true),
            BsModalContainer(child: Column(
              children: [
                Text(message),
              ],
            )),
            BsModalContainer(
              mainAxisAlignment: MainAxisAlignment.end,
              actions: [
                BsButton(
                  disabled: disabled,
                  margin: EdgeInsets.only(right: 5.0),
                  label: Text(DBText.buttonModalCancel),
                  prefixIcon: DBIcon.buttonModalCancel,
                  style: BsButtonStyle.danger,
                  size: BsButtonSize.btnSm,
                  onPressed: () {
                    Navigator.pop(context);
                    onPressed(DialogConfirmOption.NO_OPTION);
                  },
                ),
                BsButton(
                  disabled: disabled,
                  label: Text(disabled ? DBText.buttonProcessing : DBText.buttonModalDelete),
                  prefixIcon: disabled ? DBIcon.buttonProcessing : DBIcon.buttonDelete,
                  style: BsButtonStyle.primary,
                  size: BsButtonSize.btnSm,
                  onPressed: () => onPressed(DialogConfirmOption.YES_OPTION),
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}