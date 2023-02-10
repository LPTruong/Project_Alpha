import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_alpha/core/app_theme.dart';
import 'package:project_alpha/features/presentation/bloc/warnings/warnings_bloc.dart';
import 'package:project_alpha/features/presentation/pages/warnings_page.dart';

import 'dependency_injections.dart' as di;
import 'features/presentation/bloc/add_delete_update_warning/add_delete_update_warning_bloc.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<WarningsBloc>()..add(GetAllWarningsEvent())),
          BlocProvider(create: (_) => di.sl<AddDeleteUpdateWarningBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Project Alpha',
          theme: appTheme,
          home: WarningsPage(),
        ));
  }
}

