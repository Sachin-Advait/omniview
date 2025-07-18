import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:omniview/common/constants/app_strings.dart';
import 'package:omniview/common/utils/size_config.dart';
import 'package:omniview/config/theme/app_theme.dart';
import 'package:omniview/config/theme/bloc/theme_bloc.dart';
import 'package:omniview/data/source/local/bloc/user_bloc.dart';
import 'package:omniview/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await ScreenUtil.ensureScreenSize();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(BlocProvider(create: (context) => ThemeBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserBloc())],

      child: BlocListener<ThemeBloc, ThemeState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(
            state.isDark
                ? SystemUiOverlayStyle.light.copyWith(
                    statusBarColor: Colors.transparent,
                  )
                : SystemUiOverlayStyle.dark.copyWith(
                    statusBarColor: Colors.black,
                  ),
          );
        },
        child: LayoutBuilder(
          builder: (context, BoxConstraints constraints) => ScreenUtilInit(
            designSize: Size(constraints.maxWidth, constraints.maxHeight),
            minTextAdapt: true,
            ensureScreenSize: true,
            splitScreenMode: true,
            builder: (context, child) {
              AppScreenUtil().init(constraints);
              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  return MaterialApp.router(
                    routerConfig: Pages.appRouter,
                    title: AppStrings.appTitle,
                    debugShowCheckedModeBanner: false,
                    theme: AppThemes.lightTheme,
                    darkTheme: AppThemes.darkTheme,
                    themeMode: state.themeMode,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
