import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/environment/environment.dart';
import 'package:frontend/app/routes/app_router.dart';
import 'package:frontend/firebase_options.dart';
import 'package:localstorage/localstorage.dart';
import 'package:logger/logger.dart';
import 'package:toastification/toastification.dart';

import 'app/Theme/custom_theme.dart';

var logger = Logger(printer: PrettyPrinter(), output: null);

late final FirebaseApp app;
late final FirebaseAuth auth;

bool shouldUseFirebaseEmulator = false;

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();

  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  await initLocalStorage();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Environment.initWithDotenv();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);

  if (shouldUseFirebaseEmulator) {
    await auth.useAuthEmulator('localhost', 9099);
  }

  // if (!kIsWeb && Platform.isWindows) {
  //   await GoogleSignInDart.register(
  //     clientId:
  //         '406099696497-g5o9l0blii9970bgmfcfv14pioj90djd.apps.googleusercontent.com',
  //   );
  // }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: ToastificationWrapper(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Coffee Shop',
          theme: AppTheme.appTheme,
          routerConfig: AppRouter.router,
          // routerDelegate: AppRouter,
        ),
      ),
    );
  }
}
