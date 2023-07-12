import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test/API/api.dart';
import 'package:suitmedia_test/prov/email_provider.dart';
import 'package:suitmedia_test/prov/next_page.dart';

import 'package:suitmedia_test/modules/firstscreens.dart';
import 'package:suitmedia_test/modules/secondscreens.dart';
import 'package:suitmedia_test/modules/thirdscreens.dart';
import 'package:suitmedia_test/style/style.dart';

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
          create: (_) => UserProvider(apiService: ApiService()),
        ),
        ChangeNotifierProvider(
            create: (_) => NextPageProvider(apiService: ApiService())),
      ],
      child: MaterialApp(
          title: 'SuitMedia',
          // home: FirstScreen(),
          initialRoute: FirstScreen.routeName,
          debugShowCheckedModeBanner: false,
          theme: themeData,
          routes: {
            FirstScreen.routeName: (context) => FirstScreen(),
            SecondScreen.routeName: (context) => SecondScreen(
                name: ModalRoute.of(context)?.settings.arguments as String),
            ThirdScreen.routeName: (context) => ThirdScreen(),
          }),
    );
  }
}
