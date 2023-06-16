import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // initialRoute: SplashScreen.id,
          // getPages: AppRoutes.routes,
          // This prevents devices from making the app's fonts more than 3x
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.3);
            return MediaQuery(data: mediaQueryData.copyWith(textScaleFactor: scale), child: child!);
          }),
    );
  }
}
