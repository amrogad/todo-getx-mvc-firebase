import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'your_tasks': 'Tasks',
          'add_new_task': 'Add New Task',
          'task_title': 'Task Title',
          'task_desc': 'Task Description',
          'select_date' : 'Select Date',
          'add_task' : 'Add Task',
          'change_language' : 'Language',
          'general_error' : 'An error has occured, please try again later!'
        },
        'ar_AR': {
          'your_tasks': 'مهام',
          'add_new_task': 'أضف مهمة جديدة',
          'task_title': 'اسم المهمة',
          'task_desc': 'وصف المهمة',
          'select_date' : 'اختار اليوم',
          'add_task' : 'اضف المهمة',
          'change_language' : 'اللغة',
          'general_error' : 'لقد حصل خطا, الرجاء المحاولة لاحقا'
        },
      };
}
