import 'package:flutter/material.dart';
import'package:flutter_localizations/flutter_localizations.dart';

import 'views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متتبع فيروس كورونا المستجد',
      theme: ThemeData(
        primarySwatch: Colors.red,
        dividerTheme: const DividerThemeData(
          color: Colors.black,
          space: 20, thickness: 0,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 19, color: Colors.black,
          ),
        ),
      ),
      locale: const Locale('ar', 'EG'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('ar', 'EG'),
      ],
      home: const HomePage(),
    );
  }
}