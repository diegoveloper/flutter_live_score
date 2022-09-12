import 'package:flutter/material.dart';
import 'package:flutter_live_score/domain/models/match_game.dart';
import 'package:flutter_live_score/domain/models/menu.dart';
import 'package:flutter_live_score/ui/home/widgets/live_matches.dart';
import 'package:flutter_live_score/ui/themes/styles.dart';

const _headerHeight = 290.0;

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    required this.menu,
    required this.game,
    super.key,
  });

  final MatchGame game;
  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: _headerHeight,
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: 50,
                    child: Hero(
                      tag: game.heroTag,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 25,
                    right: 25,
                    bottom: 0,
                    height: _headerHeight - 1.5 * kToolbarHeight,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 900),
                      tween: Tween(begin: 0.0, end: 1.0),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: child,
                        );
                      },
                      child: MatchCard(
                        color: Colors.white,
                        game: game,
                        menu: menu,
                        heroRequired: false,
                        dark: false,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 10,
                    height: kToolbarHeight,
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).maybePop();
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text(
                            menu.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                      ],
                    ),
                  )
                ],
              ),
            ),
            _MatchStatsView(
              game: game,
            ),
          ],
        ),
      ),
    );
  }
}

class _MatchStatsView extends StatelessWidget {
  const _MatchStatsView({required this.game});

  final MatchGame game;

  @override
  Widget build(BuildContext context) {
    final percentGoalsHome = game.teamHome.goals / game.totalGoals;
    final percentGoalsAway = game.teamAway.goals / game.totalGoals;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                game.teamHome.goals.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Shots on goal'),
              Text(
                game.teamAway.goals.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: PercentIndicator(
                  color: mainColor,
                  percent: percentGoalsHome,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: PercentIndicator(
                  color: Colors.pink,
                  percent: percentGoalsAway,
                  fromLeft: false,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PercentIndicator extends StatelessWidget {
  const PercentIndicator({
    required this.color,
    required this.percent,
    this.fromLeft = true,
    super.key,
  });

  final Color color;
  final double percent;
  final bool fromLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink[100],
      height: 5,
      child: LayoutBuilder(builder: (context, constraints) {
        return TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 600),
          tween: Tween(begin: 0.0, end: percent),
          builder: (context, value, _) {
            return Align(
              alignment:
                  fromLeft ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: constraints.maxWidth * value,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
