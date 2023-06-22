import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/controllers/profile_controller.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/views/home_view.dart';
import 'constants/colors.dart';
import 'constants/routes.dart';
import 'firebase_options.dart';
import 'constants/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<TaskController>(TaskController(), permanent: true);
  Get.put<ProfileController>(ProfileController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: TodoColors.secondaryColor),
          ),
          debugShowCheckedModeBanner: false,
          translations: Languages(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          initialRoute: HomeView.id,
          getPages: AppRoutes.routes,
          // This prevents devices from making the app's fonts more than 3x to avoid overflows
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
            return MediaQuery(data: mediaQueryData.copyWith(textScaleFactor: scale), child: child!);
          }),
    );
  }
}
