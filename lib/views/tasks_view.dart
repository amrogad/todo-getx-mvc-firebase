import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/widgets/task_widget.dart';
import '../constants/colors.dart';

class TasksView extends StatelessWidget {
  static const String id = '/tasks-view';
  TasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TodoColors.shrinePink,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          children: [
            CalendarTimeline(
              initialDate: DateTime(2020, 4, 20),
              firstDate: DateTime(2019, 1, 15),
              lastDate: DateTime(2020, 11, 20),
              onDateSelected: (date) => print(date),
              dayNameColor: TodoColors.primaryColor,
              leftMargin: 20,
              monthColor: TodoColors.secondaryColor,
              dayColor: TodoColors.secondaryColor,
              activeDayColor: TodoColors.primaryColor,
              activeBackgroundDayColor: TodoColors.secondaryColor,
              dotsColor: TodoColors.primaryColor,
              selectableDayPredicate: (date) => date.day != 23,
              locale: Get.deviceLocale.toString(),
            ),
            Obx(
              () {
                TaskController taskController = Get.find<TaskController>();
                return Expanded(
                  child: ListView.builder(
                      itemCount: taskController.tasks.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: TaskWidget(
                            title: taskController.tasks[index].taskTitle,
                            desc: taskController.tasks[index].description,
                          ),
                        );
                      }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
