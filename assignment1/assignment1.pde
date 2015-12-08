Menu menu;
Visualisation barchart;
Visualisation bubblechart;
ArrayList<Season> season = new ArrayList<Season>();
ArrayList<PImage> image = new ArrayList<PImage>();
int second = 1000;
int counter = 0;
int time = -second * 5;

void setup()
{
  // You can view the full visualisations at any size,
  // however optimal view resolutions are 800 x 800 or above
  size(1200, 800);
  background(0);
  
  loadDataset();
  loadImages();
  
  menu = new Menu();
  barchart = new Barchart();
  bubblechart = new Bubblechart();
  
  menu.display();
}

void draw()
{
  cycleImages();
  menu.animateVisualisationButtons();
  
  // Works for bubblechart as well since conditions for both buttons are the same
  barchart.animateMenuButton();
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

void loadImages()
{
  int numImages = 5;
  
  for(int i = 0; i < numImages; i++)
  {
    image.add(loadImage(i + ".jpg"));
  }
}

void cycleImages()
{
  if(menu.inMenu)
  {
    int numImages = 5;
    
    if(millis() - time > (second * 5))
    {
      for(int i = 0; i < numImages; i++)
      {
        if(i == counter)
        {
          image.get(i).resize(width, 0);
        
          image(image.get(i), 0, height / 5);
        }
      }
      
      counter++;
      time = millis();
      
      if(counter == numImages)
      {
        counter = 0;
      }
    }
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


