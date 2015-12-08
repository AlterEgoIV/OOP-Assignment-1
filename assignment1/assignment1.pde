// Declare class objects
Menu menu;
Visualisation barchart;
Visualisation bubblechart;

// Initialise ArrayLists
ArrayList<Season> season = new ArrayList<Season>();
ArrayList<PImage> image = new ArrayList<PImage>();

// Global variables holding values for timing
int second = 1000;
int counter = 0;
// time had to be initialised with -5 seconds to get the images to display from the start
int time = -second * 5;

void setup()
{
  // Optimal aspect ratio is 3 : 2
  size(1200, 800);
  
  // Loads the season stats dataset
  loadDataset();
  // Loads the images used in the menu
  loadImages();
  
  // Standard object initialisation
  menu = new Menu();
  
  // Polymorphically instantiate objects as concrete types of Visualisations
  barchart = new Barchart();
  bubblechart = new Bubblechart();

  menu.display();
}

void draw()
{
  // Advanced features - image cycling in menu and button animation
  cycleImages();
  menu.animateVisualisationButtons();
  
  // Works for bubblechart as well since conditions for both buttons are the same
  barchart.animateMenuButton();
}

void mousePressed()
{
  // All program flow conditions are within the object functions themselves
  
  if(menu.inMenu)
  {
    // Changes display to barchart or bubblechart
    menu.changeDisplay();
  }
  else
  {
    // Must reset objects or the charts will no longer display
    barchart = new Barchart();
    bubblechart = new Bubblechart();
    
    // Change the display to menu - works for bubblechart as well
    barchart.changeDisplay();
  }
}

void loadDataset()
{
  // Loads the entire csv file as an array of strings
  String[] dataset = loadStrings("arsenalplseasons.csv");
  
  // For every string in the dataset
  for(String d : dataset)
  {
    // Instantiate new object to hold fVal values within its member variables
    // Must be newly instantiate upon every iteration due to object referencing
    Season s = new Season();
    ArrayList<Float> fVal = new ArrayList<Float>();
    
    // Separates String d into set of string elements based on the delimiter ","
    String[] field = d.split(",");
    
    // For every string in field
    for(String f : field)
    {
      // Add the string to fVal as a float
      fVal.add(Float.parseFloat(f));
    }
    
    // Assign elements in fVal to the appropriate member variables in s
    s.year = fVal.get(0);
    s.played = fVal.get(1);
    s.scored = fVal.get(2);
    s.conceded = fVal.get(3);
    s.wins = fVal.get(4);
    s.draws = fVal.get(5);
    s.losses = fVal.get(6);
    s.points = fVal.get(7);
    s.position = fVal.get(8);
    
    // Add the current values contained in the member 
    // variables of s to the ArrayList of season objects 
    season.add(s);
  }
}

void loadImages()
{
  // Set number of images
  int numImages = 10;
  
  // For every image, add an image to the image ArrayList
  for(int i = 0; i < numImages; i++)
  {
    image.add(loadImage(i + ".jpg"));
  }
}

void cycleImages()
{
  // If in the menu
  if(menu.inMenu)
  {
    int numImages = 10;
    
    // If the current number of milliseconds elapsed - time is greater than 5 seconds
    // Makes it so image updates every 5 seconds
    if(millis() - time > (second * 5))
    {
      // For every image
      for(int i = 0; i < numImages; i++)
      {
        // If i is equal to set image represented by counter
        if(i == counter)
        {
          // Get the current image, resize it
          image.get(i).resize(width, 0);
        
          // Display the current image
          image(image.get(i), 0, height / 5);
        }
      }
      
      counter++;
      
      /* Update time to millis() (current time passed) so that millis() will have to progress at least 
      another 5 seconds for millis() - time to be greater than 5 seconds */
      time = millis();
      
      // Reset counter
      if(counter == numImages)
      {
        counter = 0;
      }
    }
  }
  else
  {
    // Reset time to -5 seconds so that images display immediately upon return to the menu
    time = -second * 5;
  }
}


