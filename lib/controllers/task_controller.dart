import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/widgets/todo_snackbars.dart';
import '../models/Task.dart';

class TaskController extends GetxController {
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final GlobalKey<FormState> taskBottomSheetKey = GlobalKey<FormState>();
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  final RxList<Task> tasks = RxList<Task>();

  @override
  void onInit() {
    super.onInit();
    getAllTasks();
  }

  // Returns an object that points to the tasks collection
  CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection(Task.collectionName)
        // WIth converter converts the data from Firestore to task model objects and vice versa
        .withConverter(fromFirestore: (snapshot, _) => Task.fromJson(snapshot.data()!), toFirestore: (task, _) => task.toJson());
  }

  // Adds the task to a task collection in FireStore
  Future<void> addTaskToFireStore() async {
    Task task = Task(taskTitle: taskTitleController.text.trim(), date: selectedDate.value, description: taskDescController.text.trim());
    try {
      if (taskBottomSheetKey.currentState!.validate()) {
        var tasksCollection = getTasksCollection();
        var docRef = tasksCollection.doc();
        task.id = docRef.id;
        docRef.set(task);
        clearValues();
      }
    } catch (e) {
      TodoSnackbars.showTodoErrorSnackBar(Get.context!, message: 'general_error'.tr);
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> getAllTasks() async {
    final tasksCollection = getTasksCollection();
    final allTasks = await tasksCollection.get();
    tasks.addAll(allTasks.docs.map((tasks) => tasks.data()).toList());
  }

  // Opens the date picker and lets the user choose a date for their tasks
  Future<void> chooseTaskDate() async {
    final DateTime oneYearLater = selectedDate.value.add(const Duration(days: 365));
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: oneYearLater,
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  // Deletes the values from the text fields after the task has been submitted
  void clearValues() {
    taskTitleController.clear();
    taskDescController.clear();
  }
}
