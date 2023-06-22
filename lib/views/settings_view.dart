import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/fonts.dart';
import '../constants/colors.dart';

class SettingsView extends StatelessWidget {
  static const String id = '/settings-view';
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: TodoColors.shrinePink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              'change_language'.tr,
              style: TodoFonts.bodyTextSecondary(context),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () async {
                  try {
                    Locale locale = const Locale('en', 'US');
                    Get.updateLocale(locale);
                  } catch (e) {}
                },
                child: AutoSizeText('English', style: TodoFonts.bodyTextSecondary(context)),
              ),
              Container(
                width: 20.w,
              ),
              GestureDetector(
                onTap: () {
                  try {
                    Locale locale = const Locale('ar', 'AR');
                    Get.updateLocale(locale);
                  } catch (e) {}
                },
                child: AutoSizeText('العربية', style: TodoFonts.bodyTextSecondary(context)),
              ),
            ]),
          ],
        ));
  }
}
