import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sprints_project/routes/route_name.dart';
import 'package:sprints_project/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
   runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('arb', 'EG')],
      path: 'assets/translations', 
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
        theme: ThemeData(
          fontFamily: 'Suwannaphum',
          colorScheme: ColorScheme.dark(),
          appBarTheme: AppBarTheme(backgroundColor:  Color.fromARGB(255, 10, 84, 145),),
          
        ),
        routes: AppRoutes.routes,
        initialRoute: RouteName.initRoute,
    );
    }
    }
