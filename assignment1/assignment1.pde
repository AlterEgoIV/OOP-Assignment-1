void setup()
{
  size(500, 500);
  background(0);
  
  String[] dataset = loadStrings("arsenalplseasons.csv");
  ArrayList<Float> fVal = new ArrayList<Float>();
  
  for(String d : dataset)
  {
    // Moved object creation to loop
    Season s = new Season();
    
    String[] field = d.split(",");
    
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
    
    // Remove elements
    for(int i = fVal.size() - 1; i >= 0; i--)
    {
      fVal.remove(i);
    }
    
    season.add(s);
  }
  
  for(int i = 0; i < season.size(); i++)
  {
    print(season.get(i).year);
    print(season.get(i).played);
    print(season.get(i).scored);
    print(season.get(i).conceded);
    print(season.get(i).wins);
    print(season.get(i).draws);
    print(season.get(i).losses);
    print(season.get(i).points);
    println(season.get(i).position);
  }
}

ArrayList<Season> season = new ArrayList<Season>();

void draw()
{
}
