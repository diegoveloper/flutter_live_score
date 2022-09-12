import 'package:flutter/material.dart';
import 'package:flutter_live_score/domain/repository/match_repository.dart';
import 'package:flutter_live_score/ui/home/home_bloc.dart';
import 'package:flutter_live_score/ui/home/widgets/leagues_bar.dart';
import 'package:flutter_live_score/ui/home/widgets/live_matches.dart';
import 'package:flutter_live_score/ui/home/widgets/matches_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen._();

  static Widget init() => ChangeNotifierProvider(
        lazy: false,
        create: (context) => HomeBloc(
          context.read<MatchRepository>(),
        )..init(),
        child: const HomeScreen._(),
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.pink.withOpacity(0.3),
          ),
        ),
        title: const Text(
          'LiveScore',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const LeaguesBar(),
          Expanded(
            child: ListView(
              children: const [
                LiveMatches(),
                MatchesList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
