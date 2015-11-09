class Season
{
  int year;
  int played;
  int scored;
  int conceded;
  int wins;
  int draws;
  int losses;
  int points;
  int position;
  
  String[] stats = loadStrings("arsenalplseasons.csv");
  
  Season()
  {
    year = 0;
    played = 0;
    scored = 0;
    conceded = 0;
    wins = 0;
    draws = 0;
    losses = 0;
    points = 0;
    position = 0;
  }
}
