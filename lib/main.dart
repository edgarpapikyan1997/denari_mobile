import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/utils/themes/dark_theme.dart';
import 'package:denari_app/utils/themes/light_theme.dart';
import 'package:flutter/services.dart';
import '../utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(supportedLocales: const [
    Locale('en', 'US'),
  ], path: 'assets/translations', child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: lightTheme.canvasColor,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Denari App',
          theme: lightTheme,
          darkTheme: darkTheme,
        ));
  }
}
