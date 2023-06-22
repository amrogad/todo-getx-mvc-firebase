import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/views/settings_view.dart';
import 'package:todo_app/views/tasks_view.dart';

class ProfileController extends GetxController {
  Rx<int> currentIndex = 0.obs;
  final List<StatelessWidget> views = [TasksView(), const SettingsView()];
}
