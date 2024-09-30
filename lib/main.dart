import 'package:denari_app/data/notifications/repository/messages_repository.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/firebase_options.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/utils/listeners/auth_listener.dart';
import 'package:denari_app/utils/log/logging.dart';
import 'package:denari_app/utils/services/get_it.dart';
import 'package:denari_app/utils/themes/dark_theme.dart';
import 'package:denari_app/utils/themes/light_theme.dart';
import 'package:denari_app/view/screens/notifications/bloc/messages_bloc.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/extensions/extensions.dart';
import 'utils/di/config.dart';
import 'utils/env/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  ServiceLocator.configure();
  setupLogger(kDebugMode);
  configDi(const Config(env: 'dev', host: 'https://denari.mifort.com'));
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path: 'assets/translations',
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    authListener.checkAuth();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: lightTheme.canvasColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: BlocProvider(
        create: (context) => MessagesBloc(
            messagesRepository: di.get<MessagesRepository>(),
            profileRepository: di.get<ProfileRepository>()),
        child: MaterialApp.router(
          routerConfig: router,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Denari App',
          theme: lightTheme,
          darkTheme: darkTheme,
          builder: (context, child) {
            Message.context = context;
            return child ?? const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
