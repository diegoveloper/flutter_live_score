import 'package:flutter_live_score/domain/models/match_game.dart';
import 'package:flutter_live_score/domain/repository/match_repository.dart';

class MatchLocalService extends MatchRepository {
  @override
  Future<List<MatchGame>> getLiveMatches() async {
    await Future.delayed(const Duration(seconds: 2));
    return listGame.where((element) => element.live).toList();
  }

  @override
  Future<List<MatchGame>> getNonLiveMatches() async {
    await Future.delayed(const Duration(seconds: 3));
    return listGame.where((element) => !element.live).toList();
  }
}
