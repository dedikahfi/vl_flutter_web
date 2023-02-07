import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:vl/providers/master_provider.dart';
import 'package:vl/providers/theme_provider.dart';
import 'package:vl/providers/vl_provider.dart';
import 'package:vl/utils/router.dart';
import 'package:vl/utils/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('id', 'ID')],
        path: 'lang', // <-- change the path of the translation files
        fallbackLocale: const Locale('id', 'ID'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MasterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VlProvider(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (_) => ModelTheme(),
        child: Consumer<ModelTheme>(
            builder: (context, ModelTheme themeNotifier, child) {
          return MaterialApp.router(
            title: 'VL - Yayasan KNCV Indonesia',
            debugShowCheckedModeBanner: false,
            //theme
            theme: themeNotifier.isDark ? darkTheme : lightTheme,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            // themeMode: ThemeMode.system,
            themeMode: ThemeMode.light,
            //localization
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: RouterApp.router,
          );
        }),
      ),
    );
  }
}
