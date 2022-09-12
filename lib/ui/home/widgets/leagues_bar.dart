import 'package:flutter/material.dart';
import 'package:flutter_live_score/domain/models/menu.dart';
import 'package:flutter_live_score/ui/home/home_bloc.dart';
import 'package:provider/provider.dart';

class LeaguesBar extends StatelessWidget {
  const LeaguesBar({super.key});

  @override
  Widget build(BuildContext context) {
    final items = Menu.menuItems;
    final menuSelected = context.watch<HomeBloc>().menuSelected;
    //final menuSelected2 = Provider.of<HomeBloc>(context);
    return SizedBox(
      height: kToolbarHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final isSelected = menuSelected.title == item.title;
          final color = isSelected ? Colors.white : Colors.grey;
          return InkWell(
            onTap: () {
              context.read<HomeBloc>().selectMenu(item);
              //Provider.of<HomeBloc>(context, listen: false).selectMenu(item);
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                color: isSelected ? Colors.pink : Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(children: [
                Image.asset(
                  item.logo,
                  height: 25,
                  color: color,
                ),
                const SizedBox(width: 10),
                Text(
                  item.title,
                  style: TextStyle(
                    color: color,
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
