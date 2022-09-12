import 'package:flutter/material.dart';
import 'package:flutter_live_score/data/service/match_local_service.dart';
import 'package:flutter_live_score/domain/repository/match_repository.dart';
import 'package:flutter_live_score/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MatchRepository>(
          create: (context) => MatchLocalService(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter LiveScore',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen.init(),
      ),
    );
  }
}
