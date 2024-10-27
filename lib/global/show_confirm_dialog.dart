import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkg3/global/bottom_sheet.dart';
import 'package:pkg3/global/strings.dart';

warningDialog({
  required String middleText,
  bool barrierDismissible = false,
  required void Function() onOkPressed,
  required void Function() onCancelPressed,
}) {
  try {
    return Get.defaultDialog(
      barrierDismissible: barrierDismissible,
      title: AppMsgs.warning,
      middleText: middleText,
      // content: const Text('هل تريد الاستمرار؟'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(result: true); // Send true when "yes" is pressed
          },
          child: Text(AppMsgs.yes),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back(result: false); // Send false when "no" is pressed
          },
          child: Text(AppMsgs.no),
        ),
      ],
    ).then(
      (value) {
        // This callback is executed when the dialog is closed
        if (value != null && value as bool) {
          // If value is true, "yes" was pressed
          // debugPrint('Yes pressed');
          onOkPressed();
        } else {
          // Otherwise, "no" was pressed or the dialog was dismissed
          // debugPrint('No pressed');
          onCancelPressed();
        }
      },
    );
  } catch (e) {
    mShowBottomSheet(e.toString());
  }
}
