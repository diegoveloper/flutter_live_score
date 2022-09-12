import 'package:flutter/material.dart';
import 'package:flutter_live_score/domain/models/match_game.dart';
import 'package:flutter_live_score/domain/models/menu.dart';
import 'package:flutter_live_score/domain/repository/match_repository.dart';

class HomeBloc extends ChangeNotifier {
  HomeBloc(this.matchRepository);

  final MatchRepository matchRepository;

  Menu menuSelected = Menu.menuItems.first;
  List<MatchGame>? liveGames;
  List<MatchGame>? games;

  void init() {
    _getLiveMatches();
    _getNonLiveMatches();
  }

  void selectMenu(Menu menu) {
    menuSelected = menu;
    notifyListeners();
  }

  Future<void> _getLiveMatches() async {
    liveGames = await matchRepository.getLiveMatches();
    notifyListeners();
  }

  Future<void> _getNonLiveMatches() async {
    games = await matchRepository.getLiveMatches();
    notifyListeners();
  }
}
