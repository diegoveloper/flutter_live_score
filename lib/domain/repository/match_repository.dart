import 'package:flutter_live_score/domain/models/match_game.dart';

abstract class MatchRepository {
  Future<List<MatchGame>> getLiveMatches();
  Future<List<MatchGame>> getNonLiveMatches();
}
