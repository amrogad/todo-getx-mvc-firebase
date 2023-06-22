import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/fonts.dart';
import '../controllers/profile_controller.dart';
import '../widgets/add_task_bottom_sheet.dart';

class HomeView extends StatelessWidget {
  static const String id = '/home-view';
  HomeView({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: TodoColors.primaryColor,
            title: Text(
              'your_tasks'.tr,
              style: TodoFonts.bodyTextSecondary(context),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: TodoColors.primaryColor,
            onTap: (index) {
              profileController.currentIndex.value = index;
            },
            currentIndex: profileController.currentIndex.value,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            shape: const StadiumBorder(
                side: BorderSide(
              color: TodoColors.primaryColor,
              width: 3,
            )),
            onPressed: () {
              Get.bottomSheet(AddTaskBottomSheet());
            },
            child: const Icon(Icons.add),
          ),
          body: profileController.views[profileController.currentIndex.value]);
    });
  }
}
