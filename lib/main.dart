import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/widgets/app_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bytebank/screens/dashborad.dart';

import 'database/dao/contact_dao.dart';

void main() {
  runApp(BytebankApp(
    contactDAO: new ContactDAO(),
    transactionWebClient: TransactionWebClient(),
  ));
}

class BytebankApp extends StatelessWidget {
  final ContactDAO contactDAO;
  final TransactionWebClient transactionWebClient;

  BytebankApp({
    @required this.contactDAO,
    @required this.transactionWebClient,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return AppDependencies(
      transactionWebClient: transactionWebClient,
      contactDAO: contactDAO,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: Dashboard(),
      ),
    );
  }
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
