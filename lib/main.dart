import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quotes/provider/quotes_provider.dart';
import 'package:quotes/utilities/app_theme.dart';
import 'package:quotes/utilities/route_generator.dart';
import 'package:quotes/utilities/routing_constants.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<QuotesProvider>(create: (_) => QuotesProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // make status bar color transparent
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: HOME);
  }
}
