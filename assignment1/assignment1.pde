void setup()
{
  size(700, 700);
  background(0);
  
  loadDataset();
  //printDataset();
  
  Graph graph = new Graph();
  
  calcGoalsPerGame();
  
  graph.drawBarChart();
}

ArrayList<Season> season = new ArrayList<Season>();
ArrayList<Float> goalsPerGame = new ArrayList<Float>(); // Goals scored / number of games

void draw()
{
}

void loadDataset()
{
  String[] dataset = loadStrings("arsenalplseasons.csv");
  
  for(String d : dataset)
  {
    // Moved object creation to loop
    Season s = new Season();
    ArrayList<Float> fVal = new ArrayList<Float>();
    
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
    
    season.add(s);
  }
}

void printDataset()
{
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

void calcGoalsPerGame()
{
  for(int i = 0; i < season.size(); i++)
  {
    goalsPerGame.add(season.get(i).scored / season.get(i).played);
  }
  
  //generateRange();
}

/*float getMaxFromArray()
{
  float max = 0.0f;

  for(int i = 0; i < season.size(); i++)
  {
    if(goalsPerGame.get(i) > max)
    {
      max = goalsPerGame.get(i);
    }
  }
  
  println(max);
}*/


