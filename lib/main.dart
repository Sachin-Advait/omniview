import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:omniview/common/constants/app_strings.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/routes/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) => ScreenUtilInit(
        designSize: Size(constraints.maxWidth, constraints.maxHeight),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: Pages.router,
            title: AppStrings.appTitle,
            debugShowCheckedModeBanner: false,
            // builder: (context, widget) {
            //   EasyLoading.instance
            //     ..indicatorType = EasyLoadingIndicatorType.doubleBounce
            //     ..loadingStyle = EasyLoadingStyle.light
            //     ..indicatorSize = 45.0
            //     ..radius = 10.0
            //     ..progressColor = Colors.yellow
            //     ..backgroundColor = Colors.green
            //     ..indicatorColor = Colors.yellow
            //     ..textColor = Colors.yellow
            //     ..maskColor = Colors.blue.withOpacity(0.5)
            //     ..userInteractions = false
            //     ..dismissOnTap = false;
            //   return EasyLoading.init(builder: BotToastInit())(context, widget);
            // },
            // navigatorObservers: [BotToastNavigatorObserver()],
            theme: AppThemes.appTheme,
          );
        },
      ),
    );
  }
}
