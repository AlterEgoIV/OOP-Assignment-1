Menu menu;
Visualisation barchart;
Visualisation bubblechart;
ArrayList<Season> season = new ArrayList<Season>();

void setup()
{
  // You can view the full visualisations at any size,
  // however optimal view resolutions are 800 x 800 or above
  size(800, 800);
  background(0);
  
  loadDataset();
  
  menu = new Menu();
  barchart = new Barchart();
  bubblechart = new Bubblechart();
  
  menu.display();
}

void draw()
{
}

void mousePressed()
{
  if(menu.inMenu)
  {
    menu.changeDisplay();
  }
  else
  {
    barchart = new Barchart();
    bubblechart = new Bubblechart();
    barchart.changeDisplay();
  }
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

/*void printDataset()
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
}*/


