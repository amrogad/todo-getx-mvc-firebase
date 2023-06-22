import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/colors.dart';

import '../constants/fonts.dart';

class TaskWidget extends StatelessWidget {
  String title;
  String desc;
  TaskWidget({Key? key, required this.title, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(color: TodoColors.primaryColor, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                title,
                style: TodoFonts.bodyTextSecondary(context)?.copyWith(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 3.h),
                height: 4.h,
                color: TodoColors.secondaryColor,
                width: 245.w,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: AutoSizeText(
                  desc,
                  style: TodoFonts.bodyTextSecondary(context),
                ),
              ),
            ],
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            decoration: BoxDecoration(color: TodoColors.secondaryColor, borderRadius: BorderRadius.circular(15)),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
