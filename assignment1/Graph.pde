class Graph extends Visualisation
{
  float horiBorder;
  float vertBorder;
  float horiGraphLength;
  float vertGraphLength;
  float vertPoints;
  float barWidth;
  float barHeight;
  float vertSmallLineLength;
  float horiSmallLineLength;
  float inc;
  float maxValue;
  
  // Goals scored / number of games
  ArrayList<Float> goalsPerGame;
  
  Graph()
  {
    horiBorder = width / 12.0f;
    vertBorder = height / 12.0f;
    horiGraphLength = width - (horiBorder * 2.0f);
    vertGraphLength = height - (vertBorder * 2.0f);
    vertPoints = vertGraphLength / 10.0f;
    barWidth = horiGraphLength / season.size();
    barHeight = 0.0f;
    vertSmallLineLength = height / 100.0f;
    horiSmallLineLength = width / 100.0f;
    inc = 0.0f;
    maxValue = 0.0f;
    goalsPerGame = new ArrayList<Float>();
    
    calcGoalsPerGame();
  } 
  
  void calcGoalsPerGame()
  {
    for(int i = 0; i < season.size(); i++)
    {
      goalsPerGame.add(season.get(i).scored / season.get(i).played);
    }
  }
  
  void display()
  {
    stroke(255);
    strokeWeight(1);
    
    // Calculate max value from ArrayList to map range
    for(int i = 0; i < season.size(); i++)
    {
      if(goalsPerGame.get(i) > maxValue)
      {
        maxValue = goalsPerGame.get(i);
      }
    }
    
    float vertPointValue = maxValue / 10;
    
    for(int i = 0; i <= season.size(); i++)
    {    
      // Horizontal line
      textSize(width / 50);
      textAlign(CENTER);
      text("Seasons", width / 2, height - (vertBorder / 4));
      
      textSize(width / 100.0f);
      line(horiBorder, height - vertBorder, horiBorder + x, height - vertBorder);
      line(horiBorder + x, (height - vertBorder), horiBorder + x, (height - vertBorder) + vertSmallLineLength);
      
      // Out of bounds error without if() statement
      if(i < season.size())
      {
        // Map Range
        barHeight = map(goalsPerGame.get(i), 0, maxValue, 0, vertGraphLength);
        
        /*
          Extra 3 spacing aligns years properly
          Extra 20 spacing at end drops the years down a bit - looks neater
        */
        fill(255);
        text(round(season.get(i).year), horiBorder + x + 3, (height - vertBorder) + vertSmallLineLength + 20);
        
        // Draw bars
        int colour = (int)map(barHeight, 0, vertGraphLength, 0, 255);
        fill(colour, 0, 0);
        rect(horiBorder + x, (height - vertBorder) - barHeight, barWidth, barHeight);
      }
      
      /*
        Increments of y points are sufficiently bigger than increments of x points that to draw the 
        entire vertical line the points need only be drawn half as many times as there are elements in the ArrayList.
      */
      if(i < season.size() / 2)
      {
        String sf = nf(vertPointValue, 1, 2);
        vertPointValue = float(sf);
        
        pushMatrix();
        translate(horiBorder / 3, height / 2);
        rotate(-HALF_PI);
        textSize(height / 50);
        text("Goals per Game", 0, 0);
        popMatrix();
        
        // Vertical line
        textSize(width / 100.0f);
        line(horiBorder, height - vertBorder, horiBorder, (height - vertBorder) - y);
        line(horiBorder - horiSmallLineLength, (height - vertBorder) - y, horiBorder, (height - vertBorder) - y);
        
        fill(255);
        text(Float.toString(vertPointValue * i), horiBorder - horiSmallLineLength - 25, (height - vertBorder) - y);
      } 
      
      x += barWidth;
      y += vertPoints;
      inc += 0.5;
    }
  }
}
