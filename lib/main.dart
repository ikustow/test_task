// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_task/core/service/data_service.dart';
import 'package:test_task/theme/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'account/pages/account_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataService(),
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: mainColor,
            secondary: secondaryColor,
          ),
        ),
        home: const StartPage(),
      ),
    );
  }
}

// Added to display back icon in AppBar
class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AccountPage()),
          );
        },
          child: Text( S.of(context).startButtonTitle,),

        ),
      ),
    );
  }
}
