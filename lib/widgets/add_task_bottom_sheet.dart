import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/fonts.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/services/todo_form_validator.dart';

class AddTaskBottomSheet extends StatelessWidget {
  AddTaskBottomSheet({Key? key}) : super(key: key);
  final TaskController taskController = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          color: TodoColors.shrinePink,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: AutoSizeText(
                  "add_new_task".tr,
                  style: TodoFonts.bodyTextSecondary(context)?.copyWith(fontSize: 18.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Form(
                  key: taskController.taskBottomSheetKey,
                  child: Column(children: [
                    TextFormField(
                      controller: taskController.taskTitleController,
                      style: TodoFonts.bodyTextSecondary(context)?.copyWith(fontSize: 14.sp),
                      decoration: InputDecoration(
                        label: AutoSizeText('task_title'.tr, style: TodoFonts.bodyTextSecondary(context)),
                      ),
                      validator: TodoFormValidator.taskTitleValidator,
                    ),
                    TextFormField(
                      controller: taskController.taskDescController,
                      style: TodoFonts.bodyTextSecondary(context)?.copyWith(fontSize: 14.sp),
                      maxLines: 4,
                      decoration: InputDecoration(
                        label: AutoSizeText('task_desc'.tr, style: TodoFonts.bodyTextSecondary(context)),
                      ),
                      validator: TodoFormValidator.taskDescValidator,
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.sp),
                child: ElevatedButton(
                    onPressed: () {
                      taskController.chooseTaskDate();
                    },
                    child: AutoSizeText('select_date'.tr, style: TodoFonts.bodyTextWhite(context))),
              ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: Text(
                    DateFormat("dd-MM-yyyy").format(taskController.selectedDate.value).toString(),
                    style: TodoFonts.bodyTextSecondary(context),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.sp),
                child: ElevatedButton(
                    onPressed: () {
                      taskController.addTaskToFireStore();
                    },
                    child: AutoSizeText('add_task'.tr, style: TodoFonts.bodyTextWhite(context))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
