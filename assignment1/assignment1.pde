void setup()
{
  size(500, 500);
  background(0);
  
  Season s = new Season();
  String[] field;
  String[] dataset = loadStrings("arsenalplseasons.csv");
  ArrayList<Float> fVal = new ArrayList<Float>();
  
  for(String d : dataset)
  {
    field = d.split(",");
    
    for(String f : field)
    {
      fVal.add(Float.parseFloat(f));
    }
    
    s.year = fVal.get(0);
    s.played = fVal.get(1);
    s.scored = fVal.get(2);
    s.conceded = fVal.get(3);
    s.wins = fVal.get(4);
    s.draws = fVal.get(5);
    s.losses = fVal.get(6);
    s.points = fVal.get(7);
    s.position = fVal.get(8);
    
    season.add(s);
  }
  
  for(int i = 0; i < season.size(); i++)
  {
    println(season.get(i));
  }
}

ArrayList<Season> season = new ArrayList<Season>();
