import 'package:associations_app/routes/app_routes/app_routes.dart';
import 'package:associations_app/routes/page_list/page_list.dart';
import 'package:associations_app/tst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: 'KMF',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        getPages: PageList.pages,
        initialRoute: AppRoutes.splashScreen,
        // home: SliverAppBarExample(),
      ),
    );
  }
}
