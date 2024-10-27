import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkg3/global/app_colors.dart';
import 'package:pkg3/global/exception_in_crud.dart';
import 'package:pkg3/global/global.dart';
import 'package:pkg3/global/strings.dart';

mShowBottomSheet(String text) {
  try {
    Get.bottomSheet(LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          color: AppColors.white,
          child: Column(
            children: [
              Text(AppMsgs.error,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                flex: 1,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SelectableText(removeIPAddresses(text),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(AppMsgs.ok,
                      style: const TextStyle(fontWeight: FontWeight.bold)))
            ],
          ),
        );
      },
    ));
  } catch (e) {
    mPrint(e.toString());
  }
}
