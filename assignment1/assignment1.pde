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
  
  generateRange();
}

void generateRange()
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
}

void drawBarChart()
{
  stroke(255);
  
  float x = 0.0f, y = 0.0f;
  float border = width / 12.0f;
  float graphLength = width - (border * 2.0f);
  float vertPoints = graphLength / 10.0f;
  float barWidth = graphLength / season.size();
  float vertSmallLineLength = height / 100.0f;
  float horiSmallLineLength = width / 100.0f;
  float inc = 0.0f;
  textSize(width / 100.0f);
  
  for(int i = 0; i <= season.size(); i++)
  {
    // Horizontal line
    line(border, height - border, border + x, height - border);
    line(border + x, (height - border), border + x, (height - border) + vertSmallLineLength);
    
    // Out of bounds error without if() statement
    if(i < season.size())
    {
      /*
        Extra 3 spacing aligns years properly
        Extra 20 spacing at end drops the years down a bit - looks neater
      */
      fill(255);
      text(round(season.get(i).year), border + x + 3, (height - border) + vertSmallLineLength + 20);
      fill(random(255), random(255), random(255));
      rect(border + x, height - border * 2, border, border);
    }
    
    /*
      Increments of y points are sufficiently bigger than increments of x points that to draw the 
      entire vertical line the points need only be drawn half as many times as there are elements in the ArrayList.
    */
    if(i < season.size() / 2)
    {
      // Vertical line
      line(border, height - border, border, (height - border) - y);
      line(border - horiSmallLineLength, (height - border) - y, border, (height - border) - y);
      fill(255);
      text(Float.toString(inc), border - horiSmallLineLength - 20, (height - border) - y);
    } 
    
    x += barWidth;
    y += vertPoints;
    inc += 0.5;
  }
}
