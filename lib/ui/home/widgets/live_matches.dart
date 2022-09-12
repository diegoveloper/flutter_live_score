import 'package:flutter/material.dart';
import 'package:flutter_live_score/domain/models/match_game.dart';
import 'package:flutter_live_score/domain/models/menu.dart';
import 'package:flutter_live_score/domain/models/team.dart';
import 'package:flutter_live_score/ui/details/details_screen.dart';
import 'package:flutter_live_score/ui/home/home_bloc.dart';
import 'package:flutter_live_score/ui/themes/styles.dart';
import 'package:provider/provider.dart';

class LiveMatches extends StatelessWidget {
  const LiveMatches({super.key});

  @override
  Widget build(BuildContext context) {
    final games = context.watch<HomeBloc>().liveGames;
    final menu = context.watch<HomeBloc>().menuSelected;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Live Match',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(
            height: 155,
            child: games == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: games.length,
                    itemExtent: 220,
                    itemBuilder: (context, index) {
                      final game = games[index];

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              transitionsBuilder:
                                  ((context, animation, _, child) {
                                return FadeTransition(
                                    opacity: animation, child: child);
                              }),
                              pageBuilder: (context, _, __) => DetailsScreen(
                                game: game,
                                menu: menu,
                              ),
                            ),
                          );
                        },
                        child: MatchCard(
                          game: game,
                          menu: menu,
                          color: mainColor,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  const MatchCard({
    required this.game,
    required this.menu,
    required this.color,
    this.heroRequired = true,
    this.dark = true,
    super.key,
  });

  final MatchGame game;
  final Menu menu;
  final Color color;
  final bool heroRequired;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    const margin = EdgeInsets.all(8.0);
    const padding = EdgeInsets.symmetric(vertical: 5, horizontal: 15);
    final textColor = dark ? Colors.white : Colors.black;
    return Stack(
      children: [
        Positioned.fill(
          child: HeroMode(
            enabled: heroRequired,
            child: Hero(
              tag: game.heroTag,
              child: Container(
                margin: margin,
                padding: padding,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: margin,
          padding: padding,
          //width: 220,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Text(
                  menu.title,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Week 10',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: _TeamItem(
                          team: game.teamHome.team,
                          description: 'Home',
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${game.teamHome.goals}:${game.teamAway.goals}',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(height: 10),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 3.0,
                                  horizontal: 6.0,
                                ),
                                child: Text(
                                  '${game.duration}\'',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: _TeamItem(
                          team: game.teamAway.team,
                          description: 'Away',
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TeamItem extends StatelessWidget {
  const _TeamItem({
    required this.team,
    required this.description,
  });

  final Team team;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          team.logo,
          height: 40,
        ),
        const SizedBox(height: 3),
        Text(
          team.name,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
