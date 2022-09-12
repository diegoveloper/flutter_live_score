String _path = 'assets/img';

class Team {
  Team({required this.name, required this.logo, required this.league});
  String name;
  String logo;
  String league;

  static List<Team> listTeam = [
    Team(name: 'Milan', logo: '$_path/ac_milan.png', league: 'Premier League'),
    Team(
        name: 'Atl Madrid',
        logo: '$_path/atletico_madrid.png',
        league: 'Premier League'),
    Team(
        name: 'Barcelona',
        logo: '$_path/barcelona.png',
        league: 'Premier League'),
    Team(
        name: 'Bay Munchen',
        logo: '$_path/bayern_munchen.png',
        league: 'Premier League'),
    Team(name: 'Granada', logo: '$_path/granada.png', league: 'Premier League'),
    Team(
        name: 'Juventus',
        logo: '$_path/juventus_turin.png',
        league: 'Premier League'),
    Team(
        name: 'Liverpool',
        logo: '$_path/liverpool.png',
        league: 'Premier League'),
    Team(
        name: 'Manc United',
        logo: '$_path/mancester_united.png',
        league: 'Premier League'),
    Team(
        name: 'Manc City',
        logo: '$_path/manchester_city.png',
        league: 'Premier League'),
    Team(
        name: 'Newcastle',
        logo: '$_path/newcastle_united.png',
        league: 'Premier League'),
    Team(name: 'PSG', logo: '$_path/psg.png', league: 'Premier League'),
    Team(
        name: 'Real Madrid',
        logo: '$_path/real_madrid.png',
        league: 'Premier League'),
    Team(
        name: 'Red Bull',
        logo: '$_path/red_bull_leipzig.png',
        league: 'Premier League'),
    Team(
        name: 'Villarreal',
        logo: '$_path/villarreal.png',
        league: 'Premier League'),
    Team(
        name: 'Leverkusen',
        logo: '$_path/leverkusen.png',
        league: 'Premier League'),
    Team(
        name: 'Tom Tomsk',
        logo: '$_path/tom_tomsk.png',
        league: 'Premier League'),
    Team(
        name: 'Stuttgart',
        logo: '$_path/Stuttgart.png',
        league: 'Premier League'),
    Team(
        name: 'Dortmund',
        logo: '$_path/Dortmund.png',
        league: 'Premier League'),
    Team(
        name: 'Frankfurt',
        logo: '$_path/Frankfurt.png',
        league: 'Premier League'),
    Team(name: 'schalke', logo: '$_path/schalke.png', league: 'Premier League'),
  ];
}
