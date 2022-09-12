import 'package:flutter/material.dart';
import 'package:flutter_live_score/domain/models/team.dart';
import 'package:flutter_live_score/ui/home/home_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final _formatHour = DateFormat('HH:mm');
final _formatDate = DateFormat('dd MMM');

class MatchesList extends StatelessWidget {
  const MatchesList({super.key});

  @override
  Widget build(BuildContext context) {
    final games = context.watch<HomeBloc>().games;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Matchs',
            style: Theme.of(context).textTheme.headline6,
          ),
          games == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: games.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final game = games[index];
                    return SizedBox(
                      height: 90,
                      child: InkWell(
                        onTap: () {
                          //TODO: implement navigation
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 220,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 5),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: _TeamItem(
                                          team: game.teamHome.team,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              _formatHour.format(game.date),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.orange,
                                              ),
                                            ),
                                            const SizedBox(height: 3),
                                            Text(
                                              _formatDate.format(game.date),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: _TeamItem(
                                          team: game.teamAway.team,
                                          fromLeft: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}

class _TeamItem extends StatelessWidget {
  const _TeamItem({
    required this.team,
    this.fromLeft = true,
  });

  final Team team;
  final bool fromLeft;

  @override
  Widget build(BuildContext context) {
    final items = [
      Image.asset(
        team.logo,
        height: 20,
      ),
      const SizedBox(width: 3),
      Text(
        team.name,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.center,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    ];
    return Row(
      mainAxisAlignment:
          fromLeft ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: fromLeft ? items.reversed.toList() : items,
    );
  }
}
