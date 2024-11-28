import 'package:barber_shop/pages/homescreen.dart';
import 'package:barber_shop/pages/loginscreen.dart';
import 'package:barber_shop/pages/schedulescreen.dart';
import 'package:barber_shop/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: '/schedule',
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/schedule': (context) => const ScheduleScreen(),
        },
      ),
    );
  }
}
