void setup()
{
  size(800, 800);
  background(0);
  
  loadDataset();
  //printDataset();
  
  calcGoalsPerGame();
  
  drawBarChart();
}

ArrayList<Season> season = new ArrayList<Season>();
ArrayList<Float> goalsPerGame = new ArrayList<Float>(); // Goals scored / number games

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
}

void drawBarChart()
{
  stroke(255);
  
  float x = 0, y = 0;
  float border = width / 12;
  float graphLength = width - (border * 2);
  float barWidth = graphLength / season.size();
  float vertSmallLineLength = height / 100;
  float horiSmallLineLength = width / 100;
  int index = 0;
  textSize(width / 100);
  
  /*for(int i = 0; i < season.size(); i++)
  {
    line(border, height - border, border + x, height - border);
    line(border + x, (height - border), border + x, (height - border) + vertSmallLineLength);
    text(round(season.get(i).year), border + x, (height - border) + vertSmallLineLength + 20);
    
    x += barWidth;
  }*/
  
  for(int i = 0; i <= graphLength; i += barWidth)
  {    
    line(border, height - border, border + x, height - border);
    line(border + x, (height - border), border + x, (height - border) + vertSmallLineLength);
    
    if(i < graphLength)
    {
      text(round(season.get(index).year), border + x, (height - border) + vertSmallLineLength + 20);
    }
    
    if(index < season.size() - 1)
    {
      
      index++;
    }
    x += barWidth;
  }
}
