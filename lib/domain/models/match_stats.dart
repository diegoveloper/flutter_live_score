import 'package:flutter_live_score/domain/models/team.dart';

enum TypeTeam { home, away }

class MatchStats {
  MatchStats({
    required this.team,
    required this.goals,
    required this.type,
    required this.shotsOnGoal,
    required this.shots,
    required this.possession,
    required this.yellowCard,
    required this.cornerKicks,
    required this.crosses,
    required this.goalkeeperSaves,
    required this.goalkKicks,
  });
  Team team;
  int goals;
  TypeTeam type;
  int shotsOnGoal;
  int shots;
  double possession;
  int yellowCard;
  int cornerKicks;
  int crosses;
  int goalkeeperSaves;
  int goalkKicks;
}
