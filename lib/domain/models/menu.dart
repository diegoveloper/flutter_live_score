String _path = 'assets/logo';

class Menu {
  Menu({required this.title, required this.logo});
  String title;
  String logo;

  static List<Menu> menuItems = [
    Menu(title: 'Premier League', logo: '$_path/logo_primer_league.png'),
    Menu(title: 'La Liga', logo: '$_path/logo_la_liga.png'),
    Menu(title: 'Champions League', logo: '$_path/logo_champions_league.png'),
  ];
}
